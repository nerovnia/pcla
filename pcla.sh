#!/bin/bash
##num=1
##while [ $num -le $# ]
##do
##  echo $@{[num]}
##  let num++;
##done

##-h   display this help and exit" 
##-b   backup database"
##-r   restore database"
##-v   list all backup files"
##-f   path to backup files directory"
##-d   set path to backup files directory"
##-p   container MongoDB database destination port"
##  --version   output version information and exit"

port=0
version="0.3"
backup=1
restore=1

while [ "$1" != "" ]; do
    case $1 in
        -p | --port )           
          shift
          port=$1
        ;;
        -b | --backup )         
          backup=0
          echo $backup
        ;;
        -r | --restore )        
          restore=0
          echo $restore
        ;;
        -v | --version )        
          echo $version
          exit
        ;;
        -h | --help )           
          echo help
          exit
        ;;
        * )
          echo $1 not expected argument
          exit 1
    esac
    shift
done
echo port=$port
if [ $backup -eq $restore ]; then
  echo "You can set only one operation (backup | restore)"
  exit 1
elif [ $backup -eq 0 ]; then
    echo backup
  else
    echo restore
fi
# check init all parameters and it types 
