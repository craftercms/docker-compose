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
set ARG_ENTERPRISE=%2

if "%ENVIRONMENT%"=="authoring" (
  goto start_compose
)

if "%ENVIRONMENT%"=="delivery" (
  goto start_compose
)

goto print_help

:start_compose
if "%ARG_ENTERPRISE%" == "--enterprise" (
    goto start_compose_enterprise
)
if "%ARG_ENTERPRISE%" == "-e" (
    goto start_compose_enterprise
)
pushd ..\%ENVIRONMENT%
docker compose up -d
popd
goto end

:start_compose_enterprise
pushd ..\%ENVIRONMENT%
docker compose -f docker-compose.yml -f docker-compose.enterprise.yml up -d
popd
goto end

:print_help
echo "Usage:"
echo "start.bat <ENVIRONMENT (authoring, delivery)> [--enterprise, -e]"
echo "-h, --help: Prints help"
goto end

:end