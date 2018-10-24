#!/usr/bin/env bash

# test all packages are installed
PKG="pip pip3"
which ${PKG}
if [ $? -eq 0 ] ; then
    echo "packages are installed"
else
    echo "missing packages"
    exit 1
fi

# test dash module is installed
pip3 freeze | grep dash
if [ $? -eq 0 ] ; then
   echo "Python module is installed"
else
    echo "Python module is missing"
    exit 1
fi
