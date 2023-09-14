#!/bin/zsh
# https://www.baeldung.com/linux/ffmpeg-extract-video-frames

export T=/tmp/k0s0gw
export AMID=715484828
PARALLEL=/opt/homebrew/opt/parallel/bin/parallel

getframe(){
  ffmpeg -i 715484828.mp4 -ss $1 -vframes 1 $T/$AMID_$2.bmp
}

F_GETFRAME=$(functions getframe)

grm -rfv $T

gmkdir -pv $T

all_parallel(){
# https://stackoverflow.com/questions/54243732
cat <<EOF | gtime -f "\n  wall clock time - %E - %e  \n" $PARALLEL --colsep ' ' -I{} -- zsh -c ":; eval $F_GETFRAME; getframe {1} {2}"
00:00:15 02_03
00:01:00 04_05
00:02:00 06_07
00:02:30 08_09
00:03:30 10_11
EOF
}

all_nonparallel(){
  getframe 00:00:15 02_03
  getframe 00:01:00 04_05
  getframe 00:02:00 06_07
  getframe 00:02:30 08_09
  getframe 00:03:30 10_11
}

# all_nonparallel

all_parallel

grm -fv $AMID.pdf
img2pdf $T/*bmp >$AMID.pdf

# grm -rfv $T
