#!/bin/bash

if ! command -v ifconfig &> /dev/null
then
    alias ifconfig=ipconfig
fi

on_home() { 

ip=${1-192.168.187} 
if [[ $(ifconfig | grep $1) ]]; then 
 return 0; 
else 
 return 1; 
fi; 
} 
