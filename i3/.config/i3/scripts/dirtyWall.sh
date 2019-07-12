#!/bin/bash

wall=~/.wall
wallblur=~/.wallblur

cp $1 $wall
nitrogen --set-zoom-fill $wall

convert $wall -blur 30x15 $wallblur

