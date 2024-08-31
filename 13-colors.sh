#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[33m"

CHECK_ROOT(){
    if [ USERID -ne 0 ]
    then
       echo " please run with root access"
       exit 1
    fi
}

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2... $R failure $N"
        exit 1
    else
        echo -e " $2... $G Success $N"
    fi
}
CHECK_ROOT

dnf list installed git
if [ $? -ne 0 ]
then
    echo "git is not installed, please install"
    dnf git install -y
    VALIDATE $? "validating git"
else
    echo "git already installed"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo " nginx is not installed, please install"
    dnf install nginx -y
    VALIDATE $? "validating nginx"
else
    echo "nginx is already installed"
fi 


