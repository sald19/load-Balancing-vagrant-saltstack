#!/bin/bash
echo "--------------- Instalando git ----------------"
apt-get install -y git
echo "--------------- haciendo clone del repo de syntax  ----------------"
git clone https://github.com/sald19/salt-vim.git /root/salt-vim.git
cd salt-vim.git
echo "--------------- Copiando archivos a .vim de usuario ----------------"
mkdir /root/.vim
cp -r ftdetect ftplugin syntax  /root/.vim/
rm -rf /root/salt-vim.git/
