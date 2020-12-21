#!/bin/bash

on_home() { 
    if ! command -v ifconfig &> /dev/null
    then
        ifconfig() { ipconfig ;}
    fi

    ip=${1-192.168.187} 
    if [[ $(ifconfig | grep $1) ]]; then 
      return 0; 
    else 
      return 1; 
    fi; 
} 
