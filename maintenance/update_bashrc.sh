#!/bin/bash

message=${1:-"update"}
git add . && git commit -m "$message" && git push
git pull
git push
