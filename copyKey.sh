#!/bin/bash

#Check if key argument is supplied to the script
NUMBER_OF_PARAMETERS=${#}
if [[ NUMBER_OF_PARAMETERS -lt 1 ]]
then
	echo "Insufficient parameters. Usage: $(basename ${0}) <Key String>"
  exit 1
fi


#Specify ssh directory name
DIR=~/.ssh
KEY_FILE_NAME=ec2key.pem
#Check if ssh directory exists. If yes, then delete the directory
if [[ ! -d $DIR ]]
then
  echo "Directory ~/.ssh not found, creating now"
  mkdir $DIR
else
  echo "Directory ~/.ssh already exists, skipped create operation"
fi

#Create key if it does not exist
if [[ ! -f ~/.ssh/$KEY_FILE_NAME ]]
then
    KEY=${1}
    #copy inputkey to .ssh location
    cp ${1} ~/.ssh/$KEY_FILE_NAME
else
    echo "Key file already exists, skipped copy operation"
fi

