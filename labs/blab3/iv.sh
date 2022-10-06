#!/bin/bash

bash tools/iv_daemon.sh & p1=$!
bash tools/iv_daemon.sh & p2=$!
bash tools/iv_daemon.sh & p3=$!

renice +10 -p $p1
kill $p3
exit
