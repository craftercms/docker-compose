#!/usr/bin/env bash

LOCATIONS="authoring delivery serverless/s3/delivery"

for LOCATION in $LOCATIONS
do
  echo "Updating $LOCATION"
  sed -E -i.bak 's/image: ([^:]+):([^:]+) # craftercms version flag/image: \1:\2E # craftercms version flag/g' \
    ../$LOCATION/docker-compose.yml
done
