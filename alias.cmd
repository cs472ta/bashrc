:: REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor" /v "Autorun" /t REG_SZ /d "%"USERPROFILE"%"\alias.cmd
:: For older windows, the key may be: HKEY_CURRENT_USER\Software\Microsoft\Command Processor
@echo off

:: Temporary system path at cmd startup

:: set PATH=%PATH%;"C:\Program Files\Sublime Text 2\"

:: Add to path by command

:: DOSKEY add_python26=set PATH=%PATH%;"C:\Python26\"
:: DOSKEY add_python33=set PATH=%PATH%;"C:\Python33\"

:: Commands

DOSKEY ls=dir /B
DOSKEY np="C:\Program Files\Notepad++\notepad++.exe" $*  
::sublime_text.exe is name of the executable. By adding a temporary entry to system path, we don't have to write the whole directory anymore.
:: DOSKEY gsp="C:\Program Files (x86)\Sketchpad5\GSP505en.exe"
DOSKEY bashrc="C:\Program Files\Notepad++\notepad++.exe" %USERPROFILE%\alias.cmd
DOSKEY pi3=ssh pi@192.168.187.103
DOSKEY pi2=ssh pi@192.168.187.99
DOSKEY ffmpeg="C:\ffmpeg-4.2.2-win64-static\ffmpeg-4.2.2-win64-static\bin\ffmpeg.exe $*"

:: Common directories

:: DOSKEY dropbox=cd "%USERPROFILE%\Dropbox\$*"
:: DOSKEY research=cd %USERPROFILE%\Dropbox\Research\

