#!/bin/bash

BRANCH=$1
FILE=src/main/resources/database-updates/prd/db-update-$BRANCH.sql

if [ -e "$FILE" ]; then  
	echo "ok"
fi
