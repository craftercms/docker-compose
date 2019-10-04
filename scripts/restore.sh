#!/usr/bin/env bash

ENVIRONMENT=$1
BACKUP_FOLDER=$2
BACKUP_FILE=$3

if [ -z "$ENVIRONMENT" ] || [ -z "$BACKUP_FOLDER" ] || [ -z "$BACKUP_FILE" ]; then
  echo "Usage:"
  echo "./restore.sh <ENVIRONMENT> <BACKUP FOLDER> <BACKUP FILE>"
  exit 1
fi

pushd ../$ENVIRONMENT
docker-compose down
docker-compose run --rm --no-deps -v $BACKUP_FOLDER:/opt/crafter/backups tomcat restore ./backups/$BACKUP_FILE
popd
