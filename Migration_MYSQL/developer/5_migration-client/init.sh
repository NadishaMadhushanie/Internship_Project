#!/bin/sh

cd bin
echo $JAVA_HOME
sh api-manager.sh -DmigrateFromVersion=3.2.0

