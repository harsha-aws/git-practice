#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "run the script with root previlage"
exit 1
fi

dnf list installed git

if[ $? -ne 0 ]
then
echo "git is not installed please install"
dnf install git -y
if[ $? -ne 0 ]
then
echo "git installation is not success, check once"
exit 1
else
echo "instalation success"
fi