@echo off
chcp 65001 >nul
set "GAME=%~dp0game\index.html"
set "URL=file:///%GAME:\=/%"
rem Запуск без установки: Edge или Chrome в режиме приложения (без адресной строки, полный экран)
where msedge >nul 2>nul && (start "" msedge --app="%URL%" --start-fullscreen & exit /b)
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (start "" "%ProgramFiles%\Google\Chrome\Application\chrome.exe" --app="%URL%" --start-fullscreen & exit /b)
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (start "" "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" --app="%URL%" --start-fullscreen & exit /b)
start "" "%GAME%"
