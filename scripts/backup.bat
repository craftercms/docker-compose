@echo off

REM Copyright (C) 2007-2019 Crafter Software Corporation. All Rights Reserved.

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

set ENVIRONMENT="%1"
set BACKUP_FOLDER="%2"

if "%ENVIRONMENT%"=="" goto usage

if "%BACKUP_FOLDER%"=="" goto usage

pushd ..\%ENVIRONMENT%
docker-compose down
docker-compose run --rm --no-deps -v "%BACKUP_FOLDER%:/opt/crafter/backups" tomcat backup
popd
goto end

:usage
echo "Usage:"
echo "backup.bat <ENVIRONMENT> <BACKUP FOLDER>"

:end
