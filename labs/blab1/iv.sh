#!/bin/bash

if [[ $PWD =~ $HOME/* ]]; then echo $PWD;
else echo "[ERROR]: not a HOME directory"  && exit 1
fi
exit