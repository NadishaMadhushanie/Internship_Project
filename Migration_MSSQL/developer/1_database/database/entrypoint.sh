#!/bin/bash

# Run init-script with long timeout - and make it run in the background
/opt/mssql-tools/bin/sqlcmd -S 172.18.0.2 -l 60 -U SA -P 1234*Password -i setup.sql &
# Start SQL server
/opt/mssql/bin/sqlservr
