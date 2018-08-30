#!/bin/bash

./configure --prefix="${PREFIX}"
# Remove test broken in sed 4.4
sed -i.bak -e 's|testsuite/panic-tests.sh||' Makefile
make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
