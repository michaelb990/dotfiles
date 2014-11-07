#!/bin/bash

cd /var/lib
mkdir selenium
cd selenium

# download jar
wget http://selenium-release.storage.googleapis.com/2.44/selenium-server-standalone-2.44.0.jar

# create a symlink for jar (helps with updates)
ln -s selenium-server-standalone-2.44.0.jar selenium-server-standalone.jar

# download setup script to correct location
cd /etc/init.d
wget https://raw.githubusercontent.com/feniix/selenium-grid-startup/master/etc/default/selenium 
chmod +x selenium
