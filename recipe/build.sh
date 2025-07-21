#!/bin/bash
cp $BUILD_PREFIX/share/libtool/build-aux/config.* ./build-aux

./configure --prefix="${PREFIX}"
# Remove test broken on CI in sed 4.9
sed -i.bak -e 's|testsuite/panic-tests.sh||' Makefile
make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
