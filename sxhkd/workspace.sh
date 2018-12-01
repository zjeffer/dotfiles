#!/bin/sh

bspc desktop --focus ^$@ &
bspc desktop --focus ^$( expr $@ + 4 ) &