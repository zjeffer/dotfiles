#!/bin/sh

#Get command
if [[ $1 == 'play-pause' ]]; then
	cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause'
elif [[ $1 == 'next' ]]; then
	cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next'
elif [[ $1 == 'previous' ]]; then
	cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous'
elif [[ $1 == 'stop' ]]; then
	cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop'
fi

#Send command to qdbus
if [[ `qdbus | egrep -i 'org.mpris.MediaPlayer2|plasma-browser-integration' | wc -l` -eq 1 ]]; then
	qdbus `qdbus | egrep -i 'org.mpris.MediaPlayer2|plasma-browser-integration'` $cmd
else
	qdbus `cat ~/.config/activePlayer/currentPlaying.txt` $cmd
fi

unset $cmd
