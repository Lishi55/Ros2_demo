#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
timeout 5 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log
now=$(date +%M%S)
now=$((now - 1))

cat /tmp/mypkg.log |
grep "${now}"
