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

set SITE_NAME=%1

if "%SITE_NAME%"=="" (
  echo "Usage:"
  echo "init-site.bat <SITE NAME>"
  goto end
)

pushd ..\delivery
docker compose exec deployer^
  gosu crafter ./bin/init-site.sh %SITE_NAME% /data/authoring/repos/sites/%SITE_NAME%/published
popd

:end
