#!/bin/bash
if [ $# -ne 1 ]; then 
    echo "privide exactly one argument  $0 IP"
    exit 257
fi

IP=$1
REGEX="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
echo "you entered IP $IP"


if ! [[ $IP =~ $REGEX ]]; then
    echo "please enter a right IP like  [0-255].[0-255].[0-255].[0-255] "
    exit 2

fi

IP=${BASH_REMATCH[0]}

ping -c1 $IP 1> /dev/null


if [ $? -ne 0 ]; then
echo "IP $IP  is dead "
else
echo "IP $IP   is alive "
fi