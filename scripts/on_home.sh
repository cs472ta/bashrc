#!/bin/bash 
 
on_home() { 
ip=${1-192.168.187} 
if [[ $(ipconfig | grep $1) ]]; then 
 return 0; 
else 
 return 1; 
fi; 
} 
