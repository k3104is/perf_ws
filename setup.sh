#!/bin/bash

echo "DISTRO_VER=$(cat /etc/lsb-release | awk -F'=' 'NR==2 {print $2}')" > .env