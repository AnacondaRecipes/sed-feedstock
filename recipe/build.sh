#!/bin/bash
cp $BUILD_PREFIX/share/libtool/build-aux/config.* ./build-aux

./configure --prefix="${PREFIX}"
make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
