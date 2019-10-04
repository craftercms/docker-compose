#!/usr/bin/env bash

SITE_NAME=$1

if [ -z "$SITE_NAME" ]; then
  echo "Usage:"
  echo "./init-site.sh <SITE NAME>"
  exit 1
fi

pushd ../delivery
docker-compose exec deployer \
  gosu crafter ./bin/init-site.sh $SITE_NAME /data/authoring/repos/sites/$SITE_NAME/published
popd
