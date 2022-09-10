#!/bin/bash

grep -o -s --recursive -h -E "[[:alnum:]]+@[[:alnum:]]+\.[[:alpha:]]" /etc/* | tr "\n" ", " > emails.lst
exit
