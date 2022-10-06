#!/bin/bash

cur_date=$(date '+%F_%T')
mkdir ~/test && { echo "catalog test was created successfully" > ~/report ; touch ~/test/$cur_date ; }
ping www.net_nikogo.ru || echo $cur_date" - [www.net_nikogo.ru host is not available]" >> ~/report
exit
