#!/bin/sh

fail(){
  echo Error: $*
  exit -1
}

download_and_install_mod(){
  wget "http://github.com/zoocide/$1/archive/master.tar.gz" -O "$1.tar.gz" || { echo Error: can not download $1 from github.com; return -1; }
  ./cpanm -l lib $1.tar.gz || { echo Error: can not install $1; return -1; }
  rm "$1.tar.gz"
}

wget cpanmin.us -O cpanm || fail can not download cpanminus
chmod +x cpanm || fail can not make cpanm executable
download_and_install_mod Exceptions
download_and_install_mod CmdArgs

