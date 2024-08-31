#!/bin/bash
USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
          echo " run this crript with root access"
          exit 1
    fi
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed"
        exit 1
    else
        echo " S2 is success"
    fi
}
CHECK_ROOT

dnf list installed git

if [ $? -ne 0 ]
then
    echo " git is not installed please install"
    dnf install git -y
    VALIDATE $? "installing git"
else
    echo "git is installed already"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo " nginx is not installed"
    dnf install nginx -y
    VALIDATE $? "installing nginx"
else
    echo "nginx is already installed"
fi 
