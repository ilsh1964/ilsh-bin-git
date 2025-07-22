#!/bin/bash
ffmpeg -i input.mp4 -vf scale=1280:720 -c:v libx264 -crf 23 -preset medium -c:a copy output_720p.mp4
