# Office Deployment Tool

[Office 2016 Deployment Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49117)

[Reference for Click-to-Run configuration.xml file](https://technet.microsoft.com/en-US/library/jj219426.aspx)

A little script to automate the download of the Office 2016 AppV Package. The files will be located at "%USERPROFILE%\Downloads\ODT-master\setup\output" by default.

Installation:
```PowerShell
Invoke-WebRequest -Uri "https://github.com/FloMcFly/ODT/archive/master.zip" -OutFile $env:USERPROFILE\Downloads\odt.zip
Expand-Archive -Path $env:USERPROFILE\Downloads\odt.zip -DestinationPath $env:USERPROFILE\Downloads
```