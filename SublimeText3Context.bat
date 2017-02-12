@ECHO off
CLS
ECHO Add "Open with Sublime Text 3" to menu context
ECHO Remove "Open with Sublime Text 3" to menu context
SET /p prompt=Enter your choice [a/r]:
IF %prompt% EQU r GOTO Remove
IF %prompt% EQU R GOTO Remove
IF %prompt% EQU a GOTO Add
IF %prompt% EQU A GOTO Add

:Add
:: set file path of your Sublime text
ECHO Enter your "sublime_text.exe" path, ie. "C:\Program Files\Sublime Text\sublime_text.exe"
SET /p st3Path=

:: add it for all file types
@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3"         /t REG_SZ /v "" /d "Open with Sublime Text 3"   /f
@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3"         /t REG_EXPAND_SZ /v "Icon" /d "%st3Path%,0" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3\command" /t REG_SZ /v "" /d "%st3Path% \"%%1\"" /f
:: add it for folders
@reg add "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text 3"         /t REG_SZ /v "" /d "Open with Sublime Text 3"   /f
@reg add "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text 3"         /t REG_EXPAND_SZ /v "Icon" /d "%st3Path%,0" /f
@reg add "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text 3\command" /t REG_SZ /v "" /d "%st3Path% \"%%1\"" /f
GOTO exit

:Remove
@reg delete "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3"
@reg delete "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text 3"
GOTO exit

:exit
PAUSE
@exit
