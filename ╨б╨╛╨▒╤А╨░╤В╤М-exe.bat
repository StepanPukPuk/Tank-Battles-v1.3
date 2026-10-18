@echo off
chcp 65001 >nul
echo Нужен установленный Node.js (https://nodejs.org)
call npm install
call npm run build:win
echo.
echo Готово! Файл игры лежит в папке dist
pause
