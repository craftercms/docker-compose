#!/usr/bin/env bash

ENVIRONMENT=$1
BACKUP_FOLDER=$2

if [ -z "$ENVIRONMENT" ] || [ -z "$BACKUP_FOLDER" ]; then
  echo "Usage:"
  echo "./backup.sh <ENVIRONMENT> <BACKUP FOLDER>"
  exit 1
fi

pushd ../$ENVIRONMENT
docker-compose down
docker-compose run --rm --no-deps -v $BACKUP_FOLDER:/opt/crafter/backups tomcat backup
popd
