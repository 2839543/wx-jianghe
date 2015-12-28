@echo off     
echo       *******File Change Name*******   
echo ------------------------------------ 
  
echo %date:~0,4%-%date:~5,2%-%date:~8,2% %time%  

echo "time" > 123f.txt

exit
 
:error
echo. &pause