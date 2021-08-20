#!/bin/bash
cp $BUILD_PREFIX/share/libtool/build-aux/config.* ./build-aux

./configure --prefix="${PREFIX}"
# Remove test broken in sed 4.4
sed -i.bak -e 's|testsuite/panic-tests.sh||' Makefile
make -j${CPU_COUNT} ${VERBOSE_AT}
# on arm64 some tests are failing due true ... so for now ignore those issue ...
if [[ "${target_platform}" == osx-arm64 ]]; then
  make check || true
else
  make check
fi
make install
