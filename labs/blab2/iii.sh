#!/bin/bash

ps -Ao pid,command,stime | awk '{print $1}'| tail -7 | head -n 1 
exit
