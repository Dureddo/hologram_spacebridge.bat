@echo off

rem TODO: Set the path to your spacebridge executable.
set sp_path="C:\Users\Administrator\Downloads\spacebridge-0.4.1-i686-windows\bin\spacebridge.exe"

rem TODO: Set your API key in the local file "apikey.txt".
set /p api_key=<apikey.txt

rem Each device bridge / forward requires a "--forward" parameter.
rem Format is <deviceId>:<remotePort>:<localPort>
rem TODO: Define each forward as a sequentially numbered variable like these
rem       examples.
set forward_1=400485:443:37401
set forward_2=400485:80:37001

rem Let the magic happen.
set cmd_line=%sp_path% --text-mode --apikey %api_key%

setlocal EnableDelayedExpansion

set i=1
:startloop
if not defined forward_%i% goto endloop
set forward_list=!forward_list! --forward !forward_%i%!
set /a i+=1
goto startloop
:endloop

set cmd_line=%cmd_line%%forward_list%
%cmd_line%
