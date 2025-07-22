#!/bin/bash
ffmpeg -i input.mov -vf scale=720x1280 -c:v libx264 -crf 23 -preset medium -c:a copy output_720p.mp4
