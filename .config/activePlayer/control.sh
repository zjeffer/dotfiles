#!/bin/sh

#Get command
case $1 in
	'play-pause')
		cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause';;
	'next')
		cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next';;
	'previous')
		cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous';;
	'stop')
		cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop';;
	'skipForward')
		# skip 5 second forward
		cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Seek 5000000';;
	'skipBackward')
		# skip 5 second backward
		cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Seek -5000000';;
	*)
esac

#Send command to qdbus
if [[ `qdbus | egrep -i 'org.mpris.MediaPlayer2|plasma-browser-integration' | wc -l` -eq 1 ]]; then
	# if only one player is detected
	qdbus `qdbus | egrep -i 'org.mpris.MediaPlayer2|plasma-browser-integration'` $cmd
else
	# if multiple players are detected, interact with the most recent active player
	qdbus `cat ~/.config/activePlayer/currentPlaying.txt` $cmd
fi

unset cmd
