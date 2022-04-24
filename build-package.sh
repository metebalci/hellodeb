#!/bin/bash

if [[ $# -lt 1 ]]; then
  echo "./build-package.sh source|any|all|binary|full [args]"
  exit 1
fi

BUILD=$1
shift

VERSION=`dpkg-parsechangelog --show-field Version | cut -f1 -d'-'`
DEBPATH=build

./clean.sh

tar Jcvf hellodeb_${VERSION}.orig.tar.xz hellodeb.c hellodeb.1

mkdir ${DEBPATH}
cp hellodeb.c ${DEBPATH}
cp hellodeb.1 ${DEBPATH}

cp -r debian ${DEBPATH}

cd ${DEBPATH}
dpkg-buildpackage --build=$BUILD "$@"
cd ..
