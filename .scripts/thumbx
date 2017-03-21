#!/bin/bash

dir=$(dirname "${1}")

cd ${dir}

if [ -d ".thumbs" ]; then
   	rm -rf .thumbs
fi

if [ -f Thumbs.db ]; then
	vinetto -HUo . Thumbs.db
    if [ -f "index.html" ]; then
	    mv index.html .thumbs/index.html
    fi       
fi           

uzbl-browser -u .thumbs/index.html

if [ -d ".thumbs" ]; then
   	rm -rf .thumbs
fi

#killall uzbl-cookie-daemon
killall uzbl-cookie-manager
