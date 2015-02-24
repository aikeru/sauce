sauce
=====

My not-so-secret sauce - dot files and setup scripts

### One-liner for installing cygwin, packages, etc. for Windows:

```@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/aikeru/sauce/master/setup.ps1'))"```

### One-liner for installing (apt-get) packages and dotfiles for debian-based:

```curl https://raw.githubusercontent.com/aikeru/sauce/master/setup.sh | sudo bash```

* Install appropriate cygwin (x64 vs x86)
* Install cygwin packages in packages.txt
* Install Ubuntu Mono for Powerline font
* Install chocolatey (for easy installation of other things)
* Install nodejs
 
### Working on/To-Do:

* Backup any existing dot files
* Install dotfiles from the repository
* Clone/install Vundle
* Run vim PluginInstall, if this works well enough
* Adding support for installing on linux

### Development-specific future features:

* node.js: tern, jshint/jsonlint for syntastic, vim node debugger
* C#/.net: Omnisharp, maybe some kind of scaffolding for projects/solutions

