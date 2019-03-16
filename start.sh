#!/bin/bash

if [ -e "/etc/cas" ]
then
	trash /etc/cas/*
else
	sudo mkdir /etc/cas
fi

sudo chown -R $USER /etc/cas

#cp -r ./etc/cas/* /etc/cas

trash ./*.log

./build.sh help

./build.sh clean

./build.sh gencert

cp /etc/cas/thekeystore ./src/main/resources/
cp /etc/cas/cas.cer ./src/main/resources/

./build.sh run


# ps -ef | grep java
# lsof -iTCP -sTCP:LISTEN -n -P

# open http://127.0.0.1:8080/cas
# open https://127.0.0.1:8443/cas
# application.properties: cas.authn.accept.users=casuser::Mellon
