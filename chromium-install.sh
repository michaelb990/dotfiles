#!/bin/bash

apt-get install chromium-browser
apt-get install unzip
wget http://chromedriver.storage.googleapis.com/2.10/chromedriver_linux64.zip
unzip chromedriver_linux64.zip -d /usr/local/bin/
