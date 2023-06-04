#!/bin/sh

CURRENT_PLAYER_FILE="/tmp/current_player.txt"

get_players(){
    # gets a list of MPRIS compatible players
    echo `qdbus | grep -E -i 'org.mpris.MediaPlayer2|plasma.browser_integration'`
}

get_status(){
    # get the current playback status of the given player
    echo `qdbus $1 /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus 2>&1`
}

setFirstPausedPlayer() {
    for player in $(get_players) ; do
        if [[ $(get_status $player) == 'Paused' ]]; then
            echo "$player" > $CURRENT_PLAYER_FILE
            break
        fi
    done
}

while true ; do
    for player in $(get_players) ; do
        if [[ $(get_status $player) == 'Playing' ]]; then
            # if the player is playing, set it as the current playing player
			echo $player > $CURRENT_PLAYER_FILE
            break
        elif [[ $(get_status $player) == 'Stopped' ]]; then
            # if a player is stopped, we don't want to start it again
			setFirstPausedPlayer
		fi
    done
    # if the current player does not exist anymore, look for a new one
    currentPlayer=`cat $CURRENT_PLAYER_FILE`
    if [[ $(get_status $currentPlayer) == *"does not exist"* ]]; then
        # if a player is stopped, search for the next paused player
        setFirstPausedPlayer
    fi
	sleep 0.25
done
