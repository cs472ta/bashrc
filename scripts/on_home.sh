#!/bin/bash

on_home() { 
    if ! command -v ifconfig &> /dev/null
    then
        ifconfig() { ipconfig ;}
        echo "On Windows..."
    fi

    ip=${1-192.168.187} 
    if [[ $(ifconfig | grep $ip) ]]; then 
      return 0; 
    else 
      return 1; 
    fi; 
} 
