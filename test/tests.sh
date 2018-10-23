#!/usr/bin/env bash

package1=pip
package2=pip3
pip3Module=dash

if  which $package1 ; then
    echo "pip is installed"
else
    echo "Problem with the $package1 package"
    exit 1
fi

if which $package2 ; then
   echo "$package2 is installed"
else
    echo "Problem with the $package2 package"
    exit 1
fi

if pip3 freeze | grep $pip3Module ; then
   echo "Python $pip3Module is installed"
else
    echo "Python $pip3module is missing"
fi
