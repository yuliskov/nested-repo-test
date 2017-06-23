@echo off

cd /d "%~dp0"

for /f %%i in ('git config --get remote.origin.url') do set REMOTE_URL=%%i

if exist gh-pages/.git echo goto DIR_EXIST
REM dir not exist
mkdir gh-pages
cd gh-pages
git init
git checkout -b gh-pages
git remote add origin %REMOTE_URL%

:DIR_EXIST

git add -A
git commit -m 'gh-pages'
git push --set-upstream origin gh-pages

REM if dir gh-pages not exists
REM 	mkdir gh-pages
REM 	cd gh-pages
REM 	git init
REM 	git checkout -b gh-pages
REM 	git remote add origin %REMOTE%

pause
