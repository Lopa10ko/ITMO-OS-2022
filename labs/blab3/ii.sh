#!/bin/bash

at now + 2 minutes -f ./i.sh
tail -n 0 -f ~/report
# -n 0 for cls
exit
