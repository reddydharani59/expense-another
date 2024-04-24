#!/bin/bash
SOURCE_DIRECTORY=/tmp/app-logs
R="\e[31m"
Y="\e[32m"
if [ -d $SOURCE_DIRECTORY ]
then 
    echo -e "$Y source directory exists"
else 
    echo -e "$R please make sure directory $SOURCE_DIRECTORY exists"
fi