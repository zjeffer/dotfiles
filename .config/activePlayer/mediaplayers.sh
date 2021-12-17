#!/bin/sh

get_players(){
    echo `qdbus | egrep -i 'org.mpris.MediaPlayer2|plasma.browser_integration'`
}

get_status(){
    echo `qdbus $1 /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus 2>&1`
}

while true ; do
    refreshPlayers=0
    for player in $(get_players) ; do
        if [[ $(get_status $player) == 'Playing' ]]; then
			echo $player > ~/.config/activePlayer/currentPlaying.txt
			refreshPlayers=0
            break
        elif [[ $(get_status $player) == 'Stopped' ]]; then
            # if a player is stopped, we don't want to start it again
			refreshPlayers=1
		fi
    done
    # if the current player does not exist anymore, look for a new one
    currentPlayer=`cat ~/.config/activePlayer/currentPlaying.txt`
    if [[ $(get_status $currentPlayer) == *"does not exist"* ]]; then
        refreshPlayers=1
    fi
    # if a player is stopped, search for the next paused player
	if [[ $refreshPlayers == 1 ]]; then
        for player in $(get_players) ; do
            if [[ $(get_status $player) == 'Paused' ]]; then
				echo "$player" > ~/.config/activePlayer/currentPlaying.txt
				break
			fi
		done
	fi
	sleep 0.25
done
