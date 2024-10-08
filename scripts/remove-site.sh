#!/usr/bin/env bash

# Copyright (C) 2007-2019 Crafter Software Corporation. All Rights Reserved.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/license

SITE_NAME=$1

if [ -z "$SITE_NAME" ]; then
  echo "Usage:"
  echo "./remove-site.sh <SITE NAME>"
  exit 1
fi

pushd ../delivery

# Check if the current user inside the deployer container is 'crafter'
CURRENT_USER=$(docker compose exec deployer id -un)
TARGET_USER="crafter"

if [ "$CURRENT_USER" != "$TARGET_USER" ]; then
  docker compose exec deployer su crafter -c "./bin/remove-site.sh $SITE_NAME"
else
  docker compose exec deployer ./bin/remove-site.sh $SITE_NAME
fi

popd
