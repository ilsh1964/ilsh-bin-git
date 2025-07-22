#!/usr/bin/bash

ffmpeg -f concat -i 01.txt -c copy output.S01.E01.mp4
ffmpeg -f concat -i 02.txt -c copy output.S01.E02.mp4
ffmpeg -f concat -i 03.txt -c copy output.S01.E03.mp4
ffmpeg -f concat -i 04.txt -c copy output.S01.E04.mp4
ffmpeg -f concat -i 05.txt -c copy output.S01.E05.mp4
ffmpeg -f concat -i 06.txt -c copy output.S01.E06.mp4
ffmpeg -f concat -i 07.txt -c copy output.S01.E07.mp4
ffmpeg -f concat -i 08.txt -c copy output.S01.E08.mp4
ffmpeg -f concat -i 09.txt -c copy output.S01.E09.mp4
ffmpeg -f concat -i 10.txt -c copy output.S01.E10.mp4
ffmpeg -f concat -i 11.txt -c copy output.S01.E11.mp4
ffmpeg -f concat -i 12.txt -c copy output.S01.E12.mp4
ffmpeg -f concat -i 13.txt -c copy output.S01.E13.mp4

