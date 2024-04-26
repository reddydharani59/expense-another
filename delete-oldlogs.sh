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
FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while IFS= read -r line
 do 
  echo "deleting file: $line"
  rm -rf $line
done <<< $FILES 
