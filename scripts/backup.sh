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

ENVIRONMENT=$1
BACKUP_FOLDER=$2

if [ -z "$ENVIRONMENT" ] || [ -z "$BACKUP_FOLDER" ]; then
  echo "Usage:"
  echo "./backup.sh <ENVIRONMENT> <BACKUP FOLDER>"
  exit 1
fi

pushd ../$ENVIRONMENT
docker-compose down
docker-compose run --rm --no-deps -v "$BACKUP_FOLDER:/opt/crafter/backups/" tomcat backup
popd
