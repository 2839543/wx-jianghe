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
 
del 1.html 2.html


copy thrid\3.html 3-1.html
copy thrid\3.html 3-2.html

ren 3-1.html 1.html
ren 3-2.html 2.html

echo. &pause
exit
 
:error
echo. &pause