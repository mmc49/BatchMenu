@echo off

rem clear the command window to only show a prompt
cls

:MENU

rem this is the visual area that the user will see when they open the batch file
echo.
ECHO 1 - View System Information
ECHO 2 - File Operations
ECHO 3 - Network Tools
ECHO 4 - Process Management
ECHO 5 - Data Analysis
ECHO 6 - Exit
ECHO.

rem this is the input area where the user will chose the main option they want
SET /P M=Type the number of the command you wish to execute, then press ENTER:
IF %M%==1 GOTO SYSINFO
IF %M%==2 GOTO FILEOPS
IF %M%==3 GOTO NETTOOLS
IF %M%==4 GOTO PRMNG
IF %M%==5 GOTO DATAANALYSIS
IF %M%==6 GOTO :eof


rem this is HEADING 1
:SYSINFO
cls
echo 1 - display detailed config information about the computer and its operating System
echo 2 - get basic Information about the computer's codeset, caption, build number
echo 3 - get information about the processor
echo 4 - get information about installed memory
echo 5 - get information about disk drives
echo 6 - Display the host name portion of the full computer name
echo 7 - Display TCP/IP network configuration information
echo 8 - display current date
echo 9 - display current time
echo 10 - MAIN MENU
echo 11 - Exit
echo.
set /p n=type the number of the information you want to see then press enter: 

if %n%==1 goto :CONFIGINFO
if %n%==2 goto :WMICINFO
if %n%==3 goto :PROCESSORINFO
if %n%==4 goto :MEMORYINFO
if %n%==5 goto :DISKDRIVEINFO
if %n%==6 goto :HOSTNAME
if %n%==7 goto :TCPIPCONFIG
if %n%==8 goto :CURRENTDATE
if %n%==9 goto :CURRENTTIME
if %n%==10 goto :MENU
if %n%==11 goto :eof

rem this is HEADING 2
:CONFIGINFO
systeminfo
GOTO MENU

rem this is HEADING 2
:WMICINFO
wmic os get caption, codeset, buildnumber
GOTO MENU

rem this is HEADING 2
:PROCESSORINFO
wmic cpu get /all
GOTO MENU

rem this is HEADING 2
:MEMORYINFO
wmic memorychip get /all
GOTO MENU

rem this is HEADING 2
:DISKDRIVEINFO
wmic diskdrive get /all
GOTO MENU

rem this is HEADING 2
:HOSTNAME
hostname
goto MENU

rem this is HEADING 2
:TCPIPCONFIG
ipconfig /all
goto MENU

rem this is HEADING 2
:CURRENTDATE
echo %date%
goto MENU

rem this is HEADING 2
:CURRENTTIME
echo %time%
goto MENU

rem this is HEADING 1
:FILEOPS
cls
echo 1 - display/change file attributes
echo 2 - display name/change current directory
echo 3 - copy file(s) to another location
echo 4 - delete file(s)
echo 5 - display list of file and subdirs in a dir
echo 6 - create dir
echo 7 - move file(s) from dir to dir
echo 8 - remove dir
echo 9 - rename file
echo 10 - save dir and change it
echo 11 - rename dir
echo 12 - replace file
echo 13 - graphically display dir structure of drive or path
echo 14 - copy files and dir trees
echo 15 - MAIN MENU
echo 16 - Exit
echo.
set /p n=type the number of the information you want to see then press enter: 

if %n%==1 goto :FILEATTR
if %n%==2 goto :CURRENTDIR
if %n%==3 goto :FILECOPY
if %n%==4 goto :DELFILE
if %n%==5 goto :DISPLAYDIRCONTENT
if %n%==6 goto :CREATEDIR
if %n%==7 goto :MVFILE
if %n%==8 goto :REMDIR
if %n%==9 goto :RENFILE
if %n%==10 goto :SAVECHANGEDIR
if %n%==11 goto :RENDIR
if %n%==12 goto :REPLACEFILE
if %n%==13 goto :TREE
if %n%==14 goto :COPYEVERYTHING
if %n%==15 goto :MENU
if %n%==16 goto :eof


rem this is HEADING 2
:FILEATTR
echo 1 - display file attributes
echo 2 - change file attributes
echo 3 - exit
echo.
set /p n=type number and press enter:
if %n%==1 goto :DISPLAYATTR
if %n%==2 goto :CHANGEATTR
if %n%==3 goto :eof

rem this is HEADING 3 - display file attributes
:DISPLAYATTR
set /p f=Enter the name of the file:
attrib %f%
GOTO :FILEATTR
rem this is HEADING 3 - change file attributes
:CHANGEATTR
set /p n="Enter + to add an attribute or - to remove it:"
set /p a=Enter R for Read-only, H for Hidden, or any other letter you know: 
set /p f=Enter the name of the file:
attrib %n%%a% %f%
GOTO :FILEATTR

rem this is HEADING 2
:CURRENTDIR
echo 1 - display current directory name
echo 2 - change current directory
echo 3 - Exit
echo.

set /p m=choose number and press enter:
if %m%==1 goto :DIRNAME
if %m%==2 goto :CHANGEDIR
if %m%==3 goto :eof 

rem this is HEADING 3 - display directory name
:DIRNAME
cd
goto :CURRENTDIR
rem this is HEADING 3 - change current directory
:CHANGEDIR
set /p d=Input the path of the directory you wish to go to and Enter:
cd "%d%"
goto :CURRENTDIR


rem this is HEADING 2 - copy files / NO SUBHEADING
:FILECOPY
set /p f=input name of the file(s) you wish to copy:
set /p l=input location you wish to copy to:
copy %f% %l%
goto :FILEOPS

rem this is HEADING 2 - delete files / no subheadings
:DELFILE
set /p f=input name of the file(s) you want to delete:
del %f%
goto :MENU

rem this is HEADING 2 - display files and dirs inside a directory / no subheadings
:DISPLAYDIRCONTENT
set /p d=input name of the directory:
dir %d%
goto :MENU

rem this is HEADING 2 - create directory / no subheadings
:CREATEDIR
set /p n=choose the name of your new directory:
mkdir %n%
goto :MENU

rem this is HEADING 2 - move 1 or more files from dir to dir
set /p f=Input the name of the file(s) you want to move:
set /p dold=Input the name of the old directory:
set /p dnew=Enter the name of the new directory:
move %f% %dold% %dnew%
goto MENU

rem this is HEADING 2 - remove directory
:REMDIR
set /p d=Input the name of the directory:
rd %d%
goto MENU

rem this is HEADING 2 - rename file
:RENFILE
set /p f=Input the name of the file:
set /p fnew=Input the new name of file:
ren %f% %fnew%
goto MENU

rem this is HEADING 2 - save current dir and change it
:SAVECHANGEDIR
set /p d=Input the path of the new directory:
current_dir=%cd%
cd "%d%"
goto MENU

rem this is HEADING 2 - rename dir
:RENDIR
set /p dold=Input the name of the old directory:
set /p dnew=Enter the name of the new directory:
move %dold% %dnew%
goto MENU

rem this is HEADING 2 - remove all directories and subdirs recursively
set /p d=Input the name of the directory:
rd /s %d%
goto MENU

rem this is HEADING 2 - Replace a file
:REPLACEFILE
set /p pold=Input the source path of the directory:
set /p pnew=Input the destination path of the directory:
copy /Y "%pold%" "%pnew%"
goto MENU

rem this is HEADING 2 - Graphically display the directory structure of a drive or path
:TREE
set /p p=Input the path of the directory:
tree "%p%"
goto MENU

rem this is HEADING 2 - Copies files and directory trees
:COPYEVERYTHING
set /p pold=Input the source path of the directory:
set /p pnew=Input the destination path of the directory:
xcopy "%pold%" "%pnew%"
goto MENU

rem this is for the big header 1 FILEOPS
GOTO MENU



rem this is HEADING 1 
:NETTOOLS
cls
echo 1 - view current password and login restrictions for computer
echo 2 - display server and workgroup settings
echo 3 - add or remove a computer attached to the windows domain controller
echo 4 - view details of a user account
echo 5 - stop or start a service
echo 6 - display network statistics of the workstation or server
echo 7 - connect or disconect computer from a shared resource or display information about your connections
echo 8 - MAIN MENU
echo 9 - Exit
echo.
set /p n=type the number of the information you want to see then press enter: 
if %n%==1 GOTO :VIEWLOGINPASSREST
if %n%==2 GOTO :SERVERSETTINGS
if %n%==3 GOTO :ADDREMCOMP
if %n%==4 GOTO :USERACCDETAILS
if %n%==5 GOTO :STOPSTARTSERVICE
if %n%==6 GOTO :NETSTATS
if %n%==7 goto :CONDISCONCOMP
if %n%==8 GOTO :MENU
if %n%==9 GOTO :eof

rem this is HEADING 2 - view password policy
:VIEWLOGINPASSREST
net accounts, user, group, localgroup
goto MENU

rem this is HEADING 2 - display server and workgroup settings
:SERVERSETTINGS
netconfig
goto MENU

rem this is HEADING 2 - add or remove a computer attached to the wdc
:ADDREMCOMP
echo 1 - add a computer attached to the windows domain controller
echo 2 - remove a computer attached to the windows domain controller
echo 3 - Exit
echo.
set /p n=type the number of the information you want to see then press enter:
if %n%==1 GOTO :ADDCOMP
if %n%==2 GOTO :REMCOMP
if %n%==3 GOTO :eof

rem this is HEADING 3 - add a computer to windows domain controller
:ADDCOMP
set /p g=Enter group name:
set /p u=Enter user:
netdom 
goto MENU
rem this is HEADING 3 - remove a computer to windows domain controller
:REMCOMP
set /p g=Enter group name:
set /p u=Enter user:

goto MENU


rem this is HEADING 2 - view details of a user's account
:USERACCDETAILS
set /p u=Enter the username of the user account you want to see the details of:
net user %u%
goto MENU

rem this is HEADING 2 - stop or start a service
:STOPSTARTSERVICE
echo 1 - start a service
echo 2 - stop a service
echo 3 - Exit
echo.
set /p n=type the number of the information you want to see then press enter: 
if %n%==1 GOTO :STARTSERVICE
if %n%==2 GOTO :STOPSERVICE
if %n%==3 GOTO :eof

rem this is HEADING 3 - start a service; we can use net or sc, both work
:STARTSERVICE
set /p s=enter the name of the service you want to start: 
sc start %s%
goto NETTOOLS

rem this is HEADING 3 - stop a service
:STOPSERVICE
set /p s=enter the name of the service you want to stop:
sc stop %s%
goto NETTOOLS

rem this is HEADING 2 - network configuration of workgroup or server
:NETSTATS
net computer, config_
goto MENU

rem this is HEADING 2 - Connect or disconnect your computer from a shared resource or displays information about your connections
:CONDISCONCOMP
echo 1 - Connect your computer from a shared resource or displays information about your connections
echo 2 - Disconnect your computer from a shared resource or displays information about your connections
echo 3 - Exit
echo.
set /p n=type the number of the information you want to see then press enter: 
if %n%==1 GOTO :CONNECTCOMP
if %n%==2 GOTO :DISCONNECTCOMP
if %n%==3 GOTO :eof

rem this is HEADING 3 - Connect your computer from a shared resource or displays information about your connections
:CONNECTCOMP
set /p d=type drive letter:
set /p u=Enter Username: 
set /p p=Enter Password:
net share
net use %d% /user:%u% %p%
goto MENU

rem this is HEADING 3 - Disconnect your computer from a shared resource or displays information about your connections
:DISCONNECTCOMP
set /p d=type drive letter:
net share
net use %d% /delete
goto MENU


rem this is HEADING 1 
:PRMNG
cls
echo 1 - view list of running processes
echo 2 - kill a process
echo 3 - start a new Process
echo 4 - MAIN MENU
echo 5 - Exit
echo.
set /p n=type the number of the information you want to see then press enter: 
if %n%==1 GOTO :VIEWPROC
if %n%==2 GOTO :KILLPROC
if %n%==3 GOTO :STARTPROC
if %n%==4 GOTO :MENU
if %n%==5 GOTO :eof

rem this is HEADING 2 - view list of processes
:VIEWPROC
tasklist
GOTO MENU

rem this is HEADING 2 - kill Process
:KILLPROC
set /p proc=Enter the name of the process you wish to kill:
taskkill /F /IM %proc%
GOTO MENU

rem this is HEADING 2 - start new process
:STARTPROC
set /p proc=Enter the name of the process you wish to start:
start %proc%
GOTO MENU


rem this is HEADING 1
:DATAANALYSIS
cls
echo 1 - search for a string within a file
echo 2 - sort the contents of a text file
echo 3 - search for a specific string within a file
echo 4 - compare two files and display the differences
echo 5 - display the contents of a text file
echo 6 - display message "hello world!"
echo 7 - MAIN MENU
echo 8 - Exit
echo.
set /p n=type the number of the information you want to see then press enter:
if %n%==1 GOTO :SEARCHSTRING
if %n%==2 GOTO :SORTCONTENT
if %n%==3 GOTO :SEARCHSTRINGSPEC
if %n%==4 GOTO :COMPAREFILES
if %n%==5 GOTO :DISPLAYFILECONTENT
if %n%==6 GOTO :HELLOWORLD
if %n%==6 GOTO :HELLOWORLD
if %n%==7 GOTO :MENU
if %n%==8 GOTO :eof


rem this is heading 2 - search for string within a file
:SEARCHSTRING
set /p f=Enter name of the file you want to search in:
set /p str=Enter the string you want to look for:
findstr "%str%" %f%
goto MENU

rem this is heading 2 - sort content
:SORTCONTENT
set /p f=Enter name of the file you want to search in:
sort %f%
goto MENU

rem this is heading 2 - search for specific string
:SEARCHSTRINGSPEC
set /p f=Enter name of the file you want to search in:
set /p str=Enter the specific string you want to look for:
findstr /w "%str%" %f%
goto MENU

rem this is heading 2 - compare files
:COMPAREFILES
set /p fone=Enter name of the first file:
set /p ftwo=Enter name of the second file:
fc %fone% %ftwo% /C 
comp %fone% %ftwo%
goto MENU

rem this is heading 2 - display file content
:DISPLAYFILECONTENT
set /p f=input the name of the file you want to see the content of:
type %f%
goto MENU

rem this is heading 2 - display hello world
:HELLOWORLD
echo Hello World!
goto MENU