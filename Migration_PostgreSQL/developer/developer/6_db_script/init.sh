#!/bin/sh

psql --version
psql postgresql://root:pwd@172.18.0.2:5432/apim_db < am.sql
psql postgresql://root:pwd@172.18.0.2:5432/shared_db < reg-index.sql

