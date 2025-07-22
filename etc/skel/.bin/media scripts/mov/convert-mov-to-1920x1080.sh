#!/bin/bash
ffmpeg -i input.mov -vf scale=1920x1080 -c:v libx264 -crf 23 -preset medium -c:a copy output_1080p.mp4
