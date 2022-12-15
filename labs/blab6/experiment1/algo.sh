#!/bin/bash

scale=13
coeff=2
pi=0
delta_pi=3
while [ $(echo "$delta_pi==0" | bc) != "1" ]
do
    pi=$(echo "$pi+$delta_pi" | bc)
    delta_pi=$(echo "scale=$scale;(4/($coeff*($coeff+1)*($coeff+2)))-(4/(($coeff+2)*($coeff+3)*($coeff+4)))" | bc)
    coeff=$(($coeff+4))
done
