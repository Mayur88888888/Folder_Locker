@echo off
setlocal
cls
color f0
echo ================================================================================================================
Title                                           May88888888 Locker Console
echo.
echo.
hostname.exe >__t.tmp
set /p host=<__t.tmp
del __t.tmp
echo ------------********************--------Welcome  %host%----------**********************--------------------------
echo.
echo ------------------------------------------Folder Locker software version 1.0-------------------------------------
echo.
echo =================================================================================================================

echo              We need to go through some few steps as follow..
ECHO.
echo STEP 1: Directory path..
echo STEP 2: Directory Name..
echo.
echo.
echo.
echo.


:0
Echo STEP 1: Do you want to create directory in another location..?
ECHO.
SET /P A=( Y / N )
IF "%A%" == "Y"  GOTO DIFF 
IF "%A%" == "y"  GOTO DIFF
IF not "%A%" == "Y"  GOTO SAME
IF not "%A%" == "y"  GOTO SAME
goto 0

:SAME
echo.
echo              Please provide Locker name..
set /p dir_name=
md %dir_name%
echo.
if exist %dir_name% echo     Locker  created successfuly.... 
echo.
echo.
echo      We are going to protect - %dir_name% -directory....
echo.
:: if exist %USERPROFILE%\Documents\pass.txt del /q %USERPROFILE%\Documents\pass.txt
echo  PLEASE GIVE CODE..
set /p PASS=


::echo %PASS%>>%USERPROFILE%\Documents\pass.txt
echo.
echo PLEASE CONFIRM AND RE-TYPE CODE
set /p PASS_=
::echo %PASS_%>>%USERPROFILE%\Documents\pass.txt
IF %PASS% ==%PASS_% ( 
ECHO .................................Confirming......................
echo.
ECHO ...............Confirmed .........Successfuly Done....!
echo.
echo %~dp0%dir_name% -%PASS%>>%USERPROFILE%\Documents\pass.txt

ECHO [.ShellClassInfo]>>%dir_name%\desktop.ini
ECHO CLSID={20D04FE0-3AEA-1069-A2D8-08002B30309D}>>%dir_name%\desktop.ini
ATTRIB +S %dir_name%
echo.
echo.
echo *********************************************************************************************************
echo                                Your Locker has been Created Successfully.....
echo *********************************************************************************************************

) else ( 
rd /q %dir_name%
::DEL %USERPROFILE%\Documents\pass.txt
CLS
ECHO .
echo -----------------------------------------Access is denied---------------------------------------------------------------------------------------------------
ECHO .
ECHO               YOU HAVE ENTERED WRONG CODE, SO DIRECTORY HAS BEEN ERASED......
ECHO .
ECHO . 
goto same )


pause
goto end

:DIFF
CLS
echo.
::echo              Please provide Locker name..
::set /p dir_name=
echo.
::echo           Locker  created successfuly.... 
echo.
ECHO.
eCHO             So you need to choose different location...
ECHO.
ECHO. 
echo             Give drive name.like c:,d:,e:,f: etc...
ECHO.
set /p p=Drive name--
echo.
cd %p%:\
echo              Drive name  received......Now provide exact path or folder name directly..
dir

echo.
echo.
echo              Give path..[Any folder name in which you need to create locker. ] 
echo.
set /p dir_name=Folder Name----
echo.
md %dir_name%
echo.
echo      We are going to protect - %dir_name% -directory....
echo.
::del /q %USERPROFILE%\Documents\pass.txt
echo  PLEASE GIVE CODE..
set /p PASS=
::echo %USERPROFILE%\Documents\pass.txt
echo.
echo PLEASE CONFIRM AND RE-TYPE CODE
set /p PASS_=
IF %PASS% ==%PASS_% ( 
ECHO .................................Confirming......................
echo.
ECHO ...............Confirmed .........Successfuly Done....!
echo.
ECHO [.ShellClassInfo]>>%dir_name%\desktop.ini
ECHO CLSID={20D04FE0-3AEA-1069-A2D8-08002B30309D}>>%dir_name%\desktop.ini
ATTRIB +S %dir_name%
echo attibute done
echo.
echo.
echo *********************************************************************************************************
echo                                Your Locker has been Created Successfully.....
echo *********************************************************************************************************
echo %p%:%q%\%dir_name% -%PASS%>>%USERPROFILE%\Documents\pass.txt

) else ( 
rd /q %dir_name%
::DEL %USERPROFILE%\Documents\pass.txt
CLS
ECHO .
echo -------------------------Access is denied---------------------------------------------------------------
ECHO .
ECHO               YOU HAVE ENTERED WRONG CODE, SO DIRECTORY HAS BEEN ERASED......
ECHO .
ECHO . 
goto diff )
echo    Confirming..........
if exist %p%:\%q%\%dir_name% (  Echo done....
echo.
cls
echo.
echo    Your task has been colpleted successfully.......
echo.
echo   Your Locker Key has been generated becide the Locker in same directory..
echo.
echo  To open Locker, first double click on Key and continue with ansers....
echo.
echo.
echo --/\/\/\/\/\/\/---Thank you for using locker software--\/\/\/\/\/\/\/\--
echo.
echo                                To leave this window.........
pause
) else ( 
echo  Problem with folder path or drive name specified please give it correctly..............................
goto diff
 )

goto end