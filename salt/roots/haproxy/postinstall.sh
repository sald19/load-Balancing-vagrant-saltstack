#!/bin/bash

sed -i "s/ENABLED=0/ENABLED=1/" /etc/default/haproxy
mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.original 

