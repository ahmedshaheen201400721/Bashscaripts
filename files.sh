#!/bin/bash

# files [-l location ] [--location location] [-e extension] [--extension extension] [-h] [--help]
usage (){
    echo "USAGE : $0 [-l location ] [--location location] [-e extension] [--extension extension] [-h] [--help]"
    echo "Examples :"
    echo "$0 -l /etc/ -e txt -s"
    echo "$0 -l /etc/ -e img --stats"
    echo 
    exit 1
}

LOCA_SET=0
STATS=0
while [ $# -gt 0 ]; do 
    case $1 in
    -l|--location )
        LOCATION=$2
        LOCA_SET=1
        if ! [ -d $LOCATION ]; then
           usage 
        fi 
        shift 2;
        ;;
        
        -e|--extension) 
        EXT="$2"
        shift 2;
        ;;

        -s|--stats)
        STATS=1
        shift
        ;;
        
        -h|--help)
        shift
        echo "usage -h"
        usage
        ;;

        *)
        echo "usage*"
        usage
        ;;
    esac 
done
if  [ $LOCA_SET -ne 1 ]; then
    LOCATION=`pwd`
fi

echo "location : $LOCATION"

if [[ $EXT != "" ]]; then
    ls -l $LOCATION | awk '/^-/' | grep "\.$EXT$" &> /dev/null
    if [ $? -ne 0 ]; then 
       echo "No file with this extension was found"
       exit 2
    fi  
    ls $LOCATION -l |  awk '/^-/' | grep "\.$EXT$" | awk -v STATS=$STATS -f size.awk
else
    ls $LOCATION -l |  awk '/^-/'  | awk -v STATS=$STATS -f size.awk
fi

