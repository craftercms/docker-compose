#!/usr/bin/env bash

# Copyright (C) 2007-2021 Crafter Software Corporation. All Rights Reserved.
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
_arg_enterprise="false"

die()
{
  local _ret="${2:-1}"
  test "${_PRINT_HELP:-no}" = yes && print_help >&2
  echo "$1" >&2
  exit "${_ret}"
}

print_help()
{
  echo "Usage:"
  echo "./start.sh <ENVIRONMENT (authoring, delivery)> [--enterprise, -e]"
  printf '\t%s\n' "-h, --help: Prints help"
}

parse_commandline()
{
  while test $# -gt 0
  do
    _key="$1"
    case "$_key" in
      -e|--enterprise)
        _arg_enterprise="true"
        ;;
      -h|--help)
        print_help
        exit 0
        ;;
      -h*)
        print_help
        exit 0
        ;;
      *)
        echo "$_key"
        _PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
        ;;
    esac
    shift
  done
}

if [[ "$ENVIRONMENT" != "authoring" && "$ENVIRONMENT" != "delivery" ]]; then
  print_help
  exit 1
fi

parse_commandline "${@:2}"

command="docker compose up -d"

if [[ $_arg_enterprise == "true" ]]
then
  command="docker compose -f docker-compose.yml -f docker-compose.enterprise.yml up -d"
fi

pushd ../$ENVIRONMENT
eval $command
popd
