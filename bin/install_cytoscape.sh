#!/bin/bash
# -*- coding: utf-8 -*-
VERSION="3.4.0"
_VERSION=${VERSION//./_} #3.4.0 => 3_4_0

PWD=`sudo pwd`
cd `dirname $0`

#wget -P ../tmp/ http://chianti.ucsd.edu/cytoscape-$VERSION/Cytoscape_$_VERSION_unix.sh 2>&1 /dev/null
#sudo bash ../tmp/Cytoscape_"$_VERSION"_unix.sh

cd $PWD

exit 0
