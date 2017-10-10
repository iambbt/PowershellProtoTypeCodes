@echo off
echo Please wait while DLLs are registered...
%WINDIR%\microsoft.net\framework\v4.0.30319\RegAsm /codebase /tlb "%*"  >nul 2>nul
if %errorlevel%==0 goto regasm0
%WINDIR%\system32\regsvr32.exe /s "%*"  >nul 2>nul
if %errorlevel%==0 goto regcom0
goto regfinish0
:regasm0
echo "%*" DLL has been successfully registered for COM Interop (.NET).
goto regfinish0
:regcom0
echo "%*" DLL has been successfully registered for COM.
goto regfinish0
:regfinish0
