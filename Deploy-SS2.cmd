@echo off
set OutPath=Z:\www\nvscriptbeta\shock2

echo Preparing documentation (using Git Bash tools)
sed -i -b -e "s!/\*T2Version-Start\*/!/\*T2Version-Start!g" output/NVScript.html
sed -i -b -e "s!/\*T2Version-End\*/!T2Version-End\*/!g" output/NVScript.html
sed -i -b -e "s!/\*SS2Version-Start!/\*SS2Version-Start\*/!g" output/NVScript.html
sed -i -b -e "s!SS2Version-End\*/!/\*SS2Version-End\*/!g" output/NVScript.html

call PackageSource.cmd

echo Creating archive
"7z.exe" a "output\NVScript.zip" ".\output\NVScript.osm" ".\output\NVScript.html" ".\output\source" -tzip -mx9 >NUL

REM Copy build output to output path
if exist output\NVScript.osm copy output\NVScript.osm "%OutPath%"
if exist output\NVScript.html copy output\NVScript.html "%OutPath%"
if exist output\NVScript.zip copy output\NVScript.zip "%OutPath%\NVScript-SS2.zip"

REM Copy .osm to game dirs
if exist output\NVScript.osm copy output\NVScript.osm "X:\Games\ShockEd"