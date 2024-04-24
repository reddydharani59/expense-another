#!/bin/bash
source ./common.sh
CHECK_ROOT

echo "Please enter DB password:"
read  mysql_root_password

dnf module disable nodejs -y &>>$LOGFILE


dnf module enable nodejs:20 -y &>>$LOGFILE


dnf install nodejs -y &>>$LOGFILE


id expense &>>LOGFILE
if [ $? -ne 0 ]
then
 useradd expense &>>LOGFILE
 
 else
  echo "user is already exists"
fi

mkdir -p /app


curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOGFILE


cd /app
rm -rf /app/*
unzip /tmp/backend.zip &>>$LOGFILE


npm install &>>$LOGFILE

cp /home/ec2-user/expense-another/backendservice.sh /etc/systemd/system/backend.service &>>$LOGFILE

systemctl daemon-reload &>>$LOGFILE


systemctl start backend &>>$LOGFILE


systemctl enable backend &>>$LOGFILE


dnf install mysql -y &>>$LOGFILE


mysql -h db.daws-78s.site -uroot -p${mysql_root_password} < /app/schema/backend.sql &>>$LOGFILE


systemctl restart backend &>>$LOGFILE
