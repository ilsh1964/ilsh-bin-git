#!/bin/bash
ffmpeg -i $1 -vcodec libx264 -crf 23 -preset slow -acodec aac -b:a 192k -movflags +faststart $1.mp4
