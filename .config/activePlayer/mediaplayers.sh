#!/bin/sh

get_players(){
    echo `qdbus | egrep -i 'org.mpris.MediaPlayer2|plasma.browser_integration'`
}

get_status(){
    echo `qdbus $1 /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus`
}

while true ; do
    for player in $(get_players) ; do
        if [[ $(get_status $player) == 'Playing' ]]; then
			echo $player > ~/.config/activePlayer/currentPlaying.txt
			bool=0
            break
        elif [[ $(get_status $player) == 'Stopped' ]]; then
            # if a player is stopped, we don't want to start it again
            # often if i close firefox, the player will be marked as stopped while it should actually be deleted
			bool=1
		fi
    done
    # if a player is stopped, search for the next paused player
	if [[ $bool == 1 ]]; then
        for player in $(get_players) ; do
            if [[ $(get_status $player) == 'Paused' ]]; then
				echo "$player" > ~/.config/activePlayer/currentPlaying.txt
				bool=0
				break
			fi
		done
	fi
	sleep 0.25
done
