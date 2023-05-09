@echo off
setlocal
set "path_NonoOS=%USERPROFILE%\Documents\1.Scripts\3.NonoOs"
set "network_drive=V:"
set "Main_Menu_Ps1=%path_NonoOS%\archives\Menus\Main_Menu.ps1"

if "%CD%"=="%path_NonoOS%" (
        cd "%path_NonoOS%"
        powershell.exe -ExecutionPolicy Bypass -File "%Main_Menu_Ps1%"
) else if "%CD:~0,2%"=="%network_drive%" (
        rd /S /Q "%path_NonoOS%"
        mkdir "%path_NonoOS%"
        xcopy "%~dp0" "%path_NonoOS%" /e /k /h /i /q
        cd "%path_NonoOS%"
        powershell.exe -ExecutionPolicy Bypass -File "%Main_Menu_Ps1%"
) else (
        rd /S /Q "%path_NonoOS%"
        mkdir "%path_NonoOS%"
        xcopy "%~dp0" "%path_NonoOS%" /e /k /h /i /q /Y
        cd "%path_NonoOS%"
        powershell.exe -ExecutionPolicy Bypass -File "%Main_Menu_Ps1%"
)