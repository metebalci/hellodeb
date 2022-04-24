#!/bin/bash

VERSION=`dpkg-parsechangelog --show-field Version | cut -f1 -d'-'`
DEBPATH=build

./clean.sh

tar Jcvf hellodeb_${VERSION}.orig.tar.xz hellodeb.c hellodeb.1

mkdir ${DEBPATH}
cp hellodeb.c ${DEBPATH}
cp hellodeb.1 ${DEBPATH}
cp -r debian ${DEBPATH}

cd ${DEBPATH}
dpkg-source --build .
cd ..
