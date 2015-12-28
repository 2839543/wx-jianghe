@echo off     
echo       *******File Change Name*******   
echo ------------------------------------ 
echo         Version 0.0.1      
echo                           
echo             Change 2015-12-28    
echo ------------------------------------
 
echo. 
echo * please input new filename and filetype
echo * sif filename is null ,default use current directory 
echo.
 
copy first\1.html 
copy second\2.html

echo. &pause
exit
 
:error
echo. &pause