#!/bin/bash
source ./common.sh
CHECK_ROOT
dnf install nginx -y &>>$LOGFILE


systemctl enable nginx &>>$LOGFILE


systemctl start nginx &>>$LOGFILE


rm -rf /usr/share/nginx/html/* &>>$LOGFILE


curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$LOGFILE


cd /usr/share/nginx/html &>>$LOGFILE
unzip /tmp/frontend.zip &>>$LOGFILE


#check your repo and path
cp /home/ec2-user/expense-another/nginxcong.sh /etc/nginx/default.d/expense.conf &>>$LOGFILE

systemctl restart nginx &>>$LOGFILE

