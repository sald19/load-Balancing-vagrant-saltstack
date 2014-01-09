#!/bin/bash

SOURCE_MAIN="/etc/apt/sources.list"
SOURCE="/etc/apt/sources.list.d/saltstack.list"

echo "---------Agregando repositorio de saltstack y el main----------"

if grep -q "deb http://debian.saltstack.com/debian wheezy-saltstack main" $SOURCE; then
    echo "------------- el repo de saltstack ya esta agreado  ---------------"
else
    echo "#Repositorio de saltstack" >> $SOURCE
    echo "deb http://debian.saltstack.com/debian wheezy-saltstack main" >> $SOURCE
    wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -
fi

if grep -q "deb http://ftp.us.debian.org/debian wheezy main" $SOURCE_MAIN;  then
    echo "------------- el repo main de debian ya esta agreado  ---------------"
else
    echo "deb http://ftp.us.debian.org/debian wheezy main" >> $SOURCE_MAIN
fi

echo "---------Actualizando repositorios-------------"
apt-get update
apt-get upgrade

echo "---------Instalando python------------"
apt-get -y install python

echo "---------Instalando zeriomq------------"
apt-get -y install libzmq-dev

echo "---------Instalando pyzmq------------"
apt-get -y install python-zmq

echo "---------Instalando pycrypto------------"
apt-get -y install python-crypto

echo "---------Instalando msgpack-python------------"
apt-get -y install msgpack-python

echo "---------Instalando python-yaml------------"
apt-get -y install python-yaml

echo "---------Instalando python-jinja2------------"
apt-get -y install python-jinja2

if [ $1 == 'master'  ]
then
    echo "----------Instalando salt-master------------"
    apt-get -y install salt-master
elif [ $1 == 'minion'  ]
then
    echo "----------instalando salt-minion------------"
    apt-get -y install salt-minion
else
    echo "el parametro es minion o master"
fi
