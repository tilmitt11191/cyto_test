#!/bin/bash
# -*- coding: utf-8 -*-
VERSION="3.4.0"
_VERSION=${VERSION//./_} #3.4.0 => 3_4_0

PWD=`sudo pwd`
cd `dirname $0`

function log_info() { echo "$1";}

echo "check ubuntu packages"
PACKAGES=(python3 python3-pip)
for package in ${PACKAGES[@]}; do
	dpkg -l $package | grep -E "^i.+[ \t]+$package" > /dev/null
	if [ $? -ne 0 ];then
		m="$package not installed. sudo apt-get install -y $package."
		log_info "$m"
		sudo apt-get install -y $package
	else
		m="$package already installed."
		log_info "$m"
	fi
done

## Update packages


echo "check python3 packages"
PACKAGES=(xkit py2cytoscape ipython community matplotlib python3-tk)
for package in ${PACKAGES[@]}; do
	pip3 list | grep $package > /dev/null 2>&1
	if [ $? -ne 0 ];then
		m="$package not installed. sudo pip3 install $package."
		log_info "$m"
		sudo pip3 install $package > /dev/null 2>&1
	else
		m="$package already installed."
		log_info "$m"
	fi
done

cd $PWD

exit 0

<< "#__CO__"
##check directory
log_info 'directory check start.'
TARGETS=("../../var/www" "/var/www")
for target in ${TARGETS[@]}; do
	if [ ! -d $target ] ;then log_fatal "dir[$target] not exist";exit 1;fi
done

## package check
log_info 'package check start.'
PACKAGES=(mysql-server apache2 php php-cgi libapache2-mod-php php-common php-pear php-mbstring php-mysql)
for package in ${PACKAGES[@]}; do
	dpkg -l $package | grep -E "^i.+[ \t]+$package" > /dev/null
	if [ $? -ne 0 ];then
		m="$package not installed. sudo apt-get install -y $package."
		log_info "$m"
		#sudo apt-get install -y $package
	else
		m="$package already installed."
		log_info "$m"
	fi
done
#__CO__