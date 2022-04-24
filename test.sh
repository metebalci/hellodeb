#!/bin/bash

FULL_VERSION=`dpkg-parsechangelog --show-field Version`
VERSION=`dpkg-parsechangelog --show-field Version | cut -f1 -d'-'`

echo "test: $FULL_VERSION, $VERSION"

# source package
test -f hellodeb_${VERSION}.orig.tar.xz || exit 1
echo "orig OK"
test -f hellodeb_${FULL_VERSION}.debian.tar.xz || exit 1
echo "debian OK"
test -f hellodeb_${FULL_VERSION}.dsc || exit 1
echo "dsc OK"

# binary package
test -f hellodeb_${FULL_VERSION}_amd64.deb || exit 1
echo "hellodeb.deb OK"
test -f hellodeb-doc_${FULL_VERSION}_all.deb || exit 1
echo "hellodeb-doc.deb OK"

# changes and buildinfo
test -f hellodeb_${FULL_VERSION}_amd64.changes || exit 1
echo "changes OK"

test -f hellodeb_${FULL_VERSION}_amd64.buildinfo || exit 1
echo "buildinfo OK"


