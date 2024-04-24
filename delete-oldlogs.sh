#!/bin/bash
SOURCE_DIRECTORY=/tmp/app-logs
R="\e[31m"
Y="\e[32m"
if [ -d $SOURCE_DIRECTORY ]
then 
    echo "source directory exists"
else 
    echo "please make sure directory $SOURCE_DIRECTORY exists"
fi