#!/bin/bash
sudo apt-get install python-software-properties
salt_ppa="ppa:saltstack/salt"  # set appropriately
if ! grep -q "$salt_ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
  echo "#####Adding Salt repo too apt#####"
  sudo add-apt-repository $salt_ppa
fi
sudo apt-get update 
echo "#####Installing Salt Master and Minion#####"
sudo apt-get install salt-master salt-minion
echo "#####Checking if Salt is running#####"
sudo salt --versions-report
