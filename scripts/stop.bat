@echo off

REM Copyright (C) 2007-2021 Crafter Software Corporation. All Rights Reserved.

REM This program is free software: you can redistribute it and/or modify
REM it under the terms of the GNU General Public License as published by
REM the Free Software Foundation, either version 3 of the License, or
REM (at your option) any later version.

REM This program is distributed in the hope that it will be useful,
REM but WITHOUT ANY WARRANTY; without even the implied warranty of
REM MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
REM GNU General Public License for more details.

REM You should have received a copy of the GNU General Public License
REM along with this program.  If not, see <http://www.gnu.org/license

set ENVIRONMENT=%1
set ARG_DELETE_VOLUMES=%2

if "%ENVIRONMENT%"=="authoring" (
  goto stop_compose
)

if "%ENVIRONMENT%"=="delivery" (
  goto stop_compose
)

goto print_help

:stop_compose
if "%ARG_DELETE_VOLUMES%" == "--delete-volumes" (
    goto stop_compose_delete_volumes_confirm
)
if "%ARG_DELETE_VOLUMES%" == "-v" (
    goto stop_compose_delete_volumes_confirm
)
pushd ..\%ENVIRONMENT%
docker-compose down
popd
goto end

:stop_compose_delete_volumes_confirm
set CONFIRM=
echo "WARNING! This will remove named volumes declared in the volumes section of the Compose file and anonymous volumes attached to containers."
set /P CONFIRM="Are you sure to process this? [Y/n]?"
if /I "%CONFIRM%" == "y" (
    goto stop_compose_delete_volumes
)
if /I "%CONFIRM%" == "yes" (
    goto stop_compose_delete_volumes
)
if "%CONFIRM%" == "" (
    goto stop_compose_delete_volumes
)
echo "Aborting..."
goto end

:stop_compose_delete_volumes
pushd ..\%ENVIRONMENT%
docker-compose down -v
popd
goto end

:print_help
echo "Usage:"
echo "stop.bat <ENVIRONMENT (authoring, delivery)> [--delete-volumes, -v]"
echo "-h, --help: Prints help"
goto end

:end