@echo off     
echo       *******File Change Name*******   
echo ------------------------------------ 
  
echo %date:~0,4%-%date:~5,2%-%date:~8,2% %time%  
 
echo "%time%">%time%.txt


exit
 
:error
echo. &pause