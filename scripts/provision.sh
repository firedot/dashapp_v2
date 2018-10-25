#!/usr/bin/env bash

# The following line sets locale character type, because
# it's not properly set in the box used, and this creates problems with the sudo pip3 usage

LC_CTYPE="en_US.UTF-8"

exec 2>&1

which pip &>/dev/null || {
  sudo rm /var/lib/apt/lists/lock
  sudo apt-get update
  sudo rm /var/lib/apt/lists/lock
  sudo apt-get install -y python-pip
}

which pip3 &>/dev/null || {
  sudo rm /var/lib/apt/lists/lock
  sudo apt-get update
  sudo rm /var/lib/apt/lists/lock
  sudo apt-get install -y python3-pip
}

#dash
sudo pip3 install dash==0.22.0  # The core dash backend
sudo pip3 install dash-renderer==0.13.0  # The dash front-end
sudo pip3 install dash-html-components==0.11.0  # HTML components
sudo pip3 install dash-core-components==0.26.0  # Supercharged components
sudo pip3 install plotly --upgrade  # Plotly graphing library used in examples

#app prerequirement
sudo pip3 install pandas
sudo pip3 install pandas_datareader
