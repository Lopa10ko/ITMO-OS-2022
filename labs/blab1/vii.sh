#!/bin/bash

grep -o -s -h -E "[[:alnum:]]+@[[:alnum:]]+\.[[:alpha:]]" /etc/* | tr "\n" ", " > emails.lst
exit