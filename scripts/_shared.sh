#!/usr/bin/env bash

filename=$0
files="/vagrant/scripts/etc"

check_root()
{
    if [ $EUID -ne 0 ]
        then echo "$(basename ${filename}) must be run as root"
        exit 1
    fi
}

echo -e "\e[0;34m===> Running ${filename}\e[0m"
set -e
check_root
