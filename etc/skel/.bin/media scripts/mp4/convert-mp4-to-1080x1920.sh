#!/bin/bash
ffmpeg -i input.mp4 -vf scale=1080:1920 -c:v libx264 -crf 23 -preset medium -c:a copy output_1080p.mp4
