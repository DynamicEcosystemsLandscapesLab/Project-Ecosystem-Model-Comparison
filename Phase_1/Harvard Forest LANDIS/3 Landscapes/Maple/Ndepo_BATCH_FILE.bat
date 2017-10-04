set rep_num=102601
for %%a in ("C:/Program Files/LANDIS-II/v6/bin/extensions/Landis.Extension.Succession.Century.dll") do set CENTURY_DLL_DATE=%%~ta

  rem "@echo" lines below write metadata text file to scenario folder to include version information.
@echo off
@echo LANDIS Model and Extensions Last Modified Dates:> landis_version_metadata.txt
@echo Century Succession Extension DLL %CENTURY_DLL_DATE%>> landis_version_metadata.txt


     
set name=Ndep_scenario.txt
TITLE Single Cell %name% Replicate: %rep_num% Century DLL Date: %CENTURY_DLL_DATE% 
call landis-ii %name%

   


rem	set name=LYF_scenario_century
rem  TITLE Single Cell %name% R: %rep_num%
rem   for %%i in (%rep_num%) do call rc3_64bit_helprun %name% %%i
      
   
pause