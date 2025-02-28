#!/bin/bash

gcc -o mainServer hello.c -lfcgi
spawn-fcgi -p 8080 ./mainServer
nginx -g "daemon off;"