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

LOCATIONS="authoring delivery serverless/s3/delivery"

for LOCATION in $LOCATIONS
do
  echo "Updating $LOCATION"
  sed -E -i.bak 's/image: ([^:]+):([^:]+) # craftercms version flag/image: \1:\2E # craftercms version flag/g' \
    ../$LOCATION/docker-compose.yml
done
