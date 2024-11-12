@echo off
set /p username="Enter the Windows user name: "
runas /user:Magna\%username% /profile "cmd.exe /c \"start %cd%\GitExtHelper.cmd \"%cd%\"\""