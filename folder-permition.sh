#!/bin/bash

# you can enter path of a directory and it checks if you don't have permition to 'enter and write in that 
# this script give you that permition 

#note you have to give the path starting with / and ending with / too like: /etc/skell/

#to shure the directory that user entered is exist
DIR_EXITST="false"
while [ $DIR_EXITST = "false" ]
do
	read -p "please enter the path of directroy complitly: " DIRECTORY

	if [ -d $DIRECTORY ]
	then
		DIR_EXITST="true"
	else
		echo "directory does not exist!!"
	fi

done

#getting the user an user gruops to check its access later 
USER=`whoami`
GROUP=`groups`

#getting permitions, user owner and gruop owner of directory
DIR_USER=`ls -ld $DIRECTORY | awk '{print $3}'`
DIR_GRUOP=`ls -ld $DIRECTORY | awk '{print $4}'`
DIRU_PERMITION=`ls -ld $DIRECTORY | awk '{print $1}' | cut -dd -f2 | cut -c -3`
DIRG_PERMITION=`ls -ld $DIRECTORY | awk '{print $1}' | cut -dd -f2 | cut -c 4-6` 
DIRO_PERMITION=`ls -ld $DIRECTORY | awk '{print $1}' | cut -dd -f2 | cut -c 7-9`


#set the permiton for owner user of directory 
if [ $USER = $DIR_USER ]
then
	if [ $DIRU_PERMITION != "rwx" ]
	then 
		sudo chmod u+rwx $DIRECTORY
	fi
fi


#set the permiton for owner group of directory 
for GR in $GROUP;
do
	if [ $GR = $DIR_GRUOP ]
	then
		if [ $DIRG_PERMITION != "rwx" ]
		then 
			sudo chmod g+rwx $DIRECTORY
		fi
	fi
done


#set the permiton for others 
if [ $USER != $DIR_USER ]
then 
	NUM_GRP=`groups | wc -w`
	CHECK=0
	for GRP in $GROUP;
	do
		if [ $GRP != $DIR_GRUOP ]	
		then
			let CHECK=CHECK+1
		fi	
	done
	if [ $CHECK -eq $NUM_GRP ]
	then 
		sudo chmod o+rwx $DIRECTORY 
	fi
fi


echo  "permition set"
echo "you can work with $DIRECTORY directory"
ls -ld $DIRECTORY
