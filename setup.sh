#!/bin/bash
HaveDir=false

if [ "${type -t $1}"="alias" ]
then
    echo "Name not Vaild, enter a vaild name"
    exit 0
fi

if [ -z $2]
then
    mkdir ~/devenv
    Dir=~/devenv
    cd $Dir
    git clone https://github.com/DanielRustrum/Linux-Batch-Commands
    cp -R Linux-Batch-Commands/* *
    rm -r Linux-Batch-Commands
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
    echo 'export devCommand() { CWD="$PWD"; cd $2/CLI && ./command.sh "$CWD" "$@"; cd $CWD; }' >> ~/.bashrc
else
    echo "" >> ~/.bashrc
    echo "# My Dev Command" >> ~/.bashrc
    echo 'export devCommand() { CWD="$PWD"; cd $Dir/CLI && ./command.sh "$CWD" "$@"; cd $CWD; }' >> ~/.bashrc
fi

if [ -z $1 ]
then
    echo "alias mydev='devCommand" >> ~/.bashrc
else
    echo "alias $1='devCommand" >> ~/.bashrc
fi


echo "Everything is ready!"
cd ~