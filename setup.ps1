# setup.ps1
#   This is intended to...
#   1. Setup cygwin with all packages
#   2. Setup ubuntu font
#   3. Anything else that needs setting up on Windows profile

$osArch = (gwmi win32_operatingsystem | select osarchitecture).osarchitecture

if($osArch -eq "32-bit") {
    $download = "http://cygwin.com/setup-x86.exe";
    $cygInstallFolder = "c:\cygwin";
} else {
    $download = "http://cygwin.com/setup-x86_64.exe";
    $cygInstallFolder = "c:\cygwin64";
}
$TempCygDir = "$env:temp\cygInstall";
$mirror = "http://www.gtlib.gatech.edu/pub/cygwin/"; 

# Install Cygwin
if(!(Test-Path -Path $TempCygDir -PathType Container)) {
    $null = New-Item -Type Directory -Path $TempCygDir -Force
}

$packagesStr = ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/aikeru/sauce/master/packages.txt'))
$packages = ($packagesStr -split '[\r\n]') |? {$_}
$packageList = [String]::Join(",", $packages);

$client = new-object System.Net.WebClient
$client.DownloadFile($download, "$TempCygDir\setup.exe");
"Installing ===================="
$packageList
"==============================="
Start-Process -wait -FilePath "$TempCygDir\setup.exe" -ArgumentList ("-q -n -l $TempCygDir -s " + $mirror + " -R " + $cygInstallFolder + " -P " + $packageList);

"Cygwin should now be installed."

$gitHubRoot = "https://raw.githubusercontent.com/aikeru/sauce/master/";
$installFontUrl = $gitHubRoot + "scripts/Add-Font.ps1"
$fontUrl = $gitHubRoot + "assets/Ubuntu Mono for Powerline_0.ttf"

$client.DownloadFile($installFontUrl, "$TempCygDir\Add-Font.ps1");
$client.DownloadFile($fontUrl, "$TempCygDir\Ubuntu Mono for Powerline_0.ttf");

iex($TempCygDir + '\Add-Font.ps1 -Path "' + $TempCygDir + '\Ubuntu Mono for Powerline_0.ttf"');
  
"Installing Chocolatey..."

iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

"Chocolatey should be installed ..."

choco install nodejs

"Node.js should be installed now..."

