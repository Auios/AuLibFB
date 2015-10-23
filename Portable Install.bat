@echo off
set /p drv="Enter Drive (?:\) : "
xcopy inc %drv%:\FreeBASIC-1.04.0-win32\inc /e/y
xcopy lib %drv%:\FreeBASIC-1.04.0-win32\lib /e/y