#!/usr/bin/env python3
import argparse
import logging
import sys
import signal
import gi
import json
import os
gi.require_version("Playerctl", "2.0")
from gi.repository import Playerctl, GLib

logger = logging.getLogger(__name__)

def signal_handler(sig, frame):
    logger.info("Received signal to stop, exiting")
    sys.stdout.write("\n")
    sys.stdout.flush()
    # loop.quit()
    sys.exit(0)

class PlayerManager:
    def __init__(self, selected_player=None):
        self.manager = Playerctl.PlayerManager()
        self.loop = GLib.MainLoop()
        self.manager.connect("name-appeared", lambda *args: self.on_player_appeared(*args))
        self.manager.connect("player-vanished", lambda *args: self.on_player_vanished(*args))

        signal.signal(signal.SIGINT, signal_handler)
        signal.signal(signal.SIGTERM, signal_handler)
        signal.signal(signal.SIGPIPE, signal.SIG_DFL)
        self.selected_player = selected_player

        self.init_players()

    def init_players(self):
        for player in self.manager.props.player_names:
            if self.selected_player is not None and self.selected_player != player.name:
                logger.debug("{player} is not the filtered player, skipping it"
                             .format(player=player.name)
                             )
                continue
            self.init_player(player)

    def run(self):
        logger.info("Starting main loop")
        self.loop.run()
    
    def init_player(self, player):
        logger.info(f"Initialize new player: {player.name}")
        player = Playerctl.Player.new_from_name(player)
        player.connect("playback-status", self.on_playback_status_changed, None)
        player.connect("metadata", self.on_metadata_changed, None)
        self.manager.manage_player(player)
        self.on_metadata_changed(player, player.props.metadata)

    def get_players(self):
        return self.manager.props.player_names

    def write_output(self, text, player):
        logger.debug(f"Writing output: {text}")

        output = {"text": text,
                "class": "custom-" + player.props.player_name,
                "alt": player.props.player_name}

        sys.stdout.write(json.dumps(output) + "\n")
        sys.stdout.flush()

    def clear_output(self):
        sys.stdout.write("\n")
        sys.stdout.flush()

    def on_playback_status_changed(self, player, status, _=None):
        logger.debug(f"Received new playback status: {status}")
        self.on_metadata_changed(player, player.props.metadata)

    def on_metadata_changed(self, player, metadata, _=None):
        logger.debug("Received new metadata")
        track_info = ""

        player_name = player.props.player_name
        artist = player.get_artist()
        title = player.get_title()

        if player_name == "spotify" and "mpris:trackid" in metadata.keys() and ":ad:" in player.props.metadata["mpris:trackid"]:
            track_info = "Advertisement"
        elif artist is not None and title is not None:
            track_info = f"{artist} - {title}"
        else:
            track_info = title

        if track_info:
            if player.props.status == "Playing":
                track_info = " " + track_info
            else:
                track_info = " " + track_info
        self.write_output(track_info, player)

    def on_player_appeared(self, _, player):
        if player is not None and (self.selected_player is None or player.name == self.selected_player):
            self.init_player(player)
        else:
            logger.debug("New player appeared, but it's not the selected player, skipping")

    def on_player_vanished(self, _, player):
        logger.info("Player has vanished")
        # check if other player is running
        players = self.get_players()
        if len(players) > 0:
            # if any are playing, show the first one that is playing
            for player in players[::-1]: # reverse order, so that the most recently added ones are preferred
                if player.props.status == "Playing":
                    self.on_metadata_changed(player, player.props.metadata)
                    return
                else:
                    logger.debug(f"{player.props.player_name} is not playing, status = {player.props.status}")
            # if none are playing, show the first one
            self.on_metadata_changed(players[0], players[0].props.metadata)
        else:
            self.clear_output()

def parse_arguments():
    parser = argparse.ArgumentParser()

    # Increase verbosity with every occurrence of -v
    parser.add_argument("-v", "--verbose", action="count", default=0)

    # Define for which player we"re listening
    parser.add_argument("--player")

    parser.add_argument("--enable-logging", action="store_true")

    return parser.parse_args()

def main():
    arguments = parse_arguments()

    # Initialize logging
    if arguments.enable_logging:
        logfile = os.path.join(os.path.dirname(os.path.realpath(__file__)), "media-player.log")
        logging.basicConfig(filename=logfile, level=logging.DEBUG, format="%(asctime)s %(name)s %(levelname)s %(message)s")

    # Logging is set by default to WARN and higher.
    # With every occurrence of -v it"s lowered by one
    logger.setLevel(max((3 - arguments.verbose) * 10, 0))

    logger.info("Creating player manager")
    if arguments.player:
        logger.info(f"Filtering for player: {arguments.player}")
    player = PlayerManager(arguments.player)
    player.run()


if __name__ == "__main__":
    main()
