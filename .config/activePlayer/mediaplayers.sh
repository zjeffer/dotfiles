#!/bin/sh

while true ; do
	for m in `qdbus | egrep -i 'org.mpris.MediaPlayer2|plasma.browser_integration'` ; do
		if [[ `qdbus $m /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus` == 'Playing' ]]; then
			echo $m > ~/.config/activePlayer/currentPlaying.txt
			break
			bool=0
		elif [[ `qdbus $m /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus` == 'Stopped' ]]; then
			bool=1
		fi
	done
	#if [[ $bool == 1 ]]; then
	#	for m in `qdbus | egrep -i 'org.mpris.MediaPlayer2|plasma.browser_integration'` ; do
	#		if [[ `qdbus $m /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus` == 'Paused' ]]; then
	#			echo $m > ~/.config/activePlayer/currentPlaying.txt
	#			bool=0
	#			break
	#		fi
	#	done
	#fi
	sleep 0.5
done
