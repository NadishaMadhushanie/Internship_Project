#!/bin/sh

echo "hi"
psql --version
psql postgresql://root:pwd@172.18.0.2:5432/apim_db < update.sql

