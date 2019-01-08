#!/bin/sh

while true ; do
	for m in `qdbus | egrep -i 'org.mpris.MediaPlayer2|plasma-browser-integration'` ; do
		if [[ `qdbus $m /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus` == 'Playing' ]]; then
			echo $m > ~/.config/activePlayer/currentPlaying.txt
		fi
	done
	sleep 1
done