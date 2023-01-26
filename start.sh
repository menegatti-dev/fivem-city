#!/bin/bash

# save the script directory
SCRIPT=$(readlink -f "$0")
SERVERPATH=$(dirname "$SCRIPT")/server

# donwload server 
if [ ! -d $SERVERPATH ];
then
    mkdir $SERVERPATH
fi

if [ ! -d $SERVERPATH/alpine ];
then
    SERVER_URL="https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5848-4f71128ee48b07026d6d7229a60ebc5f40f2b9db/fx.tar.xz"
    wget $SERVER_URL -P $SERVERPATH \
    && tar xf $SERVERPATH/fx.tar.xz -C $SERVERPATH/ \
    && rm $SERVERPATH/fx.tar.xz
fi

cd ./src && bash ../server/run.sh +exec server.cfg