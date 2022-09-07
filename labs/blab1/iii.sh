#!/bin/bash

echo -e "Choose your option from list below\n1. nano;\n2. vi;\n3. links browser;\n4. exit"
read chosen
case $chosen in
1 ) nano ;;
2 ) vi ;;
3 ) links ;;
4 ) echo "exited with code $?" && exit ;;
esac