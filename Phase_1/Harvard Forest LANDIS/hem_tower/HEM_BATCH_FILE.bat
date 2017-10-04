set rep_num=102601
	for %%a in ("C:/Program Files/LANDIS-II/v6/bin/extensions/Landis.Extension.Succession.Century.dll") do set CENTURY_DLL_DATE=%%~ta

  rem "@echo" lines below write metadata text file to scenario folder to include version information.
@echo off
@echo LANDIS Model and Extensions Last Modified Dates:> landis_version_metadata.txt
@echo Century Succession Extension DLL %CENTURY_DLL_DATE%>> landis_version_metadata.txt


   
set name=HEM_scenario_century.txt
TITLE Single Cell %name% Replicate: %rep_num% Century DLL Date: %CENTURY_DLL_DATE% 
call landis-ii %name%
	 
pause