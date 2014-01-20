#!/bin/bash

touch /etc/apt/sources.list.d/haproxy.list

echo "deb http://ftp.de.debian.org/debian wheezy-backports main" > /etc/apt/sources.list.d/haproxy.list

apt-get update
