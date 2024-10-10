#!/bin/bash

#this script checks a specific log file and sends an email to admin if an error found
#you should set the path of log file and the email address (or username) of admin


#the path of log file
LOG_FILE="/var/log/syslog"

# email of admin
MAIL="mahdi"


cat $LOG_FILE | grep "error" > /tmp/error

ERROR_SIZE=`ls --size /tmp/error | awk '{print($1)}' `


#Check if an error has been found
if [ $ERROR_SIZE -ne 0 ]
then 
	echo "error is found in $LOG_FILE" | mail -s "error is found" $MAIL
fi


rm /tmp/error
