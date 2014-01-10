#!/bin/bash

echo "--------------- Instalando vim ----------------"
apt-get install -y vim
echo "--------------- Instalando git ----------------"
apt-get install -y git
echo "--------------- haciendo clone del repo de syntax  ----------------"
git clone https://github.com/sald19/salt-vim.git /root/salt-vim.git
cd /root/salt-vim.git
echo "--------------- seteando vimrc  ----------------"
echo "syntax on" > /root/.vimrc
echo "--------------- Agregando syntax de YAML a vim ----------------"
mkdir /root/.vim
cp -r ftdetect ftplugin syntax /root/.vim/
rm -rf /root/salt-vim.git/
