rmdir output /S /Q
rmdir source /S /Q
mkdir output
setup.exe /download configuration.xml
setup.exe /packager configuration.xml output
copy "%temp%\OfficeSetup.txt" o365update.log
echo "Check %TEMP% for more logfiles"
pause