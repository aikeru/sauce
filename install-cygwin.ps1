# install-cygwin.ps1
#	This is supposed to
#	1. Download and install Cygwin (x86 or x64)
#	2. Install packages silently
# This is very much a WIP

function Install-Cygwin {
   param ( $TempCygDir="$env:temp\cygInstall" )
   if(!(Test-Path -Path $TempCygDir -PathType Container))
    {
       $null = New-Item -Type Directory -Path $TempCygDir -Force
    }
   
   $packages = [Collections.Generic.List[String]]@();
   gc .\packages2.txt | %{ $packages.Add($_) } 
   $packageList = [String]::Join(" ", $packages)
   
   $client = new-object System.Net.WebClient
   $client.DownloadFile("http://cygwin.com/setup-x86.exe", "$TempCygDir\setup.exe" )
   Start-Process -wait -FilePath "$TempCygDir\setup.exe" -ArgumentList "-q -n -l c:\CygwinPackages -s http://mirror.nyi.net/cygwin/ -R c:\Cygwin"
   Start-Process -wait -FilePath "$TempCygDir\setup.exe" -ArgumentList ("-q -n -l $TempCygDir -s http://mirror.nyi.net/cygwin/ -R c:\Cygwin -P " + $packageList)
}

function Install-Cygwin64 {
   param ( $TempCygDir="$env:temp\cygInstall" )
   if(!(Test-Path -Path $TempCygDir -PathType Container))
    {
       $null = New-Item -Type Directory -Path $TempCygDir -Force
    }
	
   $packages = [Collections.Generic.List[String]]@();
   gc .\packages2.txt | %{ $packages.Add($_) } 
   $packageList = [String]::Join(" ", $packages)
	
   $client = new-object System.Net.WebClient
   $client.DownloadFile("http://cygwin.com/setup.exe", "$TempCygDir\setup.exe" )
   Start-Process -wait -FilePath "$TempCygDir\setup.exe" -ArgumentList "-q -n -l $TempCygDir -s http://mirror.nyi.net/cygwin/ -R c:\Cygwin"
   Start-Process -wait -FilePath "$TempCygDir\setup.exe" -ArgumentList "-q -n -l $TempCygDir -s http://mirror.nyi.net/cygwin/ -R c:\Cygwin -P openssh"
}
