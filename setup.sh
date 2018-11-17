#!/bin/bash
HaveDir=false
if [ -z $2]
then
    Dir=~/devenv
else
    HaveDir=true
fi

if [ HaveDir ]
then
    cd $2
else
    cd $Dir
fi

mkdir Commands

if [ HaveDir ]
then 
    echo "" >> ~/.bashrc
    echo "# My Dev Command" >> ~/.bashrc
    echo 'devCommand() { CWD="$PWD"; cd $2/CLI && ./command.sh "$CWD" "$@"; cd $CWD; }' >> ~/.bashrc
else
    echo "" >> ~/.bashrc
    echo "# My Dev Command" >> ~/.bashrc
    echo 'devCommand() { CWD="$PWD"; cd $Dir/CLI && ./command.sh "$CWD" "$@"; cd $CWD; }' >> ~/.bashrc
fi

if [ -z $1 ]
then
    echo "alias mydev='devCommand" >> ~/.bashrc
else
    echo "alias $1='devCommand" >> ~/.bashrc
fi