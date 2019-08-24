#!/usr/bin/env bash

if curl -s "http://ec2-18-219-86-226.us-east-2.compute.amazonaws.com/" | grep "simple app"
then
    # if the keyword is in the conent
    echo " the website is working fine"
    exit 0 
else
    echo "Error"
    exit 1
fi
