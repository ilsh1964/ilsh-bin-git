#!/bin/bash
ffmpeg -i input.mov -vf scale=1280x720 -c:v libx264 -crf 23 -preset medium -c:a copy output_720p.mp4
