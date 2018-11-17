# Linux-Batch-Commands
Creates a Linux alias and adds the ability to run Multiple Cutomized commands underneath that alias.

call the alias once installed for more info.

# Setup
- Download/clone the repo
- call the executable setup.sh AliasName DirectoryDownloadedToo
- Whalla! Package Installed

# Adding Commands
- create a folder with the command name, it has to be all lower case and spaces are replaced with underscores
- add an executable run.sh file and a help.txt file
- copy the files needed to run the command in the created folder
- call the nessacary commands in the run.sh file

# Tips
- The first argument passed into run.sh is the current user directory
- the other arguments are the arguments passed after the command, if you only want that info then use ${@:2} to get the rest of the commands
- help file will be printed into the console when called alias -h command


<b>Warning:</b> Don't trusted other people commands there isn't any security mesures past the measure given by the os.  