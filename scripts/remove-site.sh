#!/usr/bin/env bash

SITE_NAME=$1

if [ -z "$SITE_NAME" ]; then
  echo "Usage:"
  echo "./remove-site.sh <SITE NAME>"
  exit 1
fi

pushd ../delivery
docker-compose exec deployer gosu crafter ./bin/remove-site.sh $SITE_NAME
popd
