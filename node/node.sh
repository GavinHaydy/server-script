#!/bin/bash
wget https://nodejs.org/dist/v14.15.1/node-v14.15.1-linux-x64.tar.xz
tar xf node-v14.15.1-linux-x64.tar.xz
rm -rf node-v14.15.1-linux-x64.tar.xz
mv node-v14.15.1-linux-x64 /usr/local/nodejs
cd /usr/local/nodejs
rm -rf /usr/local/bin/npm
rm -rf /usr/local/bin/node
ln -s /usr/local/nodejs/bin/npm   /usr/local/bin/
ln -s /usr/local/nodejs/bin/node   /usr/local/bin/
node -v
