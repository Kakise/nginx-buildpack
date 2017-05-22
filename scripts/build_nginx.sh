#!/bin/bash
# Build NGINX and modules on Heroku.
# This program is designed to run in a web dyno provided by Heroku.
# We would like to build an NGINX binary for the builpack on the
# exact machine in which the binary will run.
# Our motivation for running in a web dyno is that we need a way to
# download the binary once it is built so we can vendor it in the buildpack.
#
# Once the dyno has is 'up' you can open your browser and navigate
# this dyno's directory structure to download the nginx binary.

# NGINX coming from google's script that includes PageSpeed module

echo "Building nginx..."

bash <(curl -f -L -sS https://gist.githubusercontent.com/Kakise/dc5f241b0deac02342a6902e7cf30208/raw/8eb69151ecc7a5bba3ddbcfc4aad7e7650b863a4/nginx_install.sh) \
     --nginx-version latest \
     --additional-nginx-configure-arguments "--prefix=/tmp/nginx" \
     --assume-yes

echo "Build finished"

while true
do
	sleep 1
	echo "."
done
