#!/bin/python3
import argparse
import os

os.nice(20)

qualities = ["very-low", "low",
             "medium", "high", "very-high"]
speeds = ["very-fast", "fast", "medium", "slow"]

parser = argparse.ArgumentParser(description='Encode video with FFMPEG')
parser.add_argument('output', help="Output file location")
parser.add_argument('-i', '--input', help="Input file location")
parser.add_argument(
    '-c', '--codec', choices=["av1", "vp9", "hevc", "h265", "h264"], help="Video codec")
# parser.add_argument(
#    '-a:c', choices=["copy", "opus", "aac", "mp3"], help="Audio codec")

parser.add_argument('-q', '--quality', choices=qualities,
                    default="medium", help="Quality level to encode at")
parser.add_argument(
    '-s', '--speed', choices=speeds, default="medium", help="Speed to encode at")

parser.add_argument('--extra-args', default="",
                    help="Extra arguments to pass to FFMPEG")

args = parser.parse_args()

quality_index = qualities.index(args.quality)
speed_index = speeds.index(args.speed)

if (args.codec == 'av1'):
    # 2-pass encoding has ~1% improvement because of svt's large lookahead
    quality = [50, 48, 43, 38, 32][quality_index]
    speed = [6, 5, 4, 3][speed_index]
    video_params = "-c:v libsvtav1 -preset %d -g 300 -row-mt 1 -qp %d -c:a libopus -b:a 128k" % (
        speed, quality)
    os.system('ffmpeg -i %s %s %s %s' %
              (args.input, args.extra_args, video_params, args.output))
elif (args.codec == 'vp9'):
    # TODO: Use quality to decide on 2 pass or 1 pass encode? Not doing 2 pass is kind of stupid though
    quality = [50, 45, 40, 35, 30][quality_index]
    video_params = "-c:v libvpx-vp9 -crf %d -b:v 0 -row-mt 1 -c:a libopus -b:a 128k" % (quality)
    os.system("ffmpeg -i %s %s -pass 1 -an -f null /dev/null && ffmpeg -i %s %s -pass 2 %s" %
              (args.input, video_params, args.input, video_params, args.output))
elif (args.codec == 'hevc' or args.codec == 'h265'):
    quality = [38, 33, 28, 24, 20][quality_index]
    speed = ["fast", "medium", "slow", "slower"][speed_index]
    video_params = "-c:v libx265 -crf %d -preset %s -c:a aac -b:a 128k" % (quality, speed)
    os.system("ffmpeg -i %s %s %s" % (args.input, video_params, args.output))
elif (args.codec == 'h264'):
    quality = [30, 24, 20, 15, 10][quality_index]
    speed = ["veryfast", "fast", "medium", "slow"][speed_index]
    video_params = "-c:v libx264 -crf %d -preset %s -c:a aac -b:a 128k" % (
        quality, speed)
    os.system("ffmpeg -i %s %s %s" % (args.input, video_params, args.output))
