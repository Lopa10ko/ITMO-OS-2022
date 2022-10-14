#!/bin/bash

mkfifo pipe
./v_log.sh &
./v_gen.sh
rm pipe
