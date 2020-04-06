#!/bin/bash
#offline jdk install
command -v javac >/dev/null 2>&1
if [ $? -ne 0 ]; then
echo "Install Jdk...."
    source /etc/os-release
case $ID in
debian|ubuntu|devuan)
    sudo add-apt-repository ppa:openjdk-r/ppa
    sudo apt update
    sudo apt install openjdk-8-jdk
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
    ;;
centos|fedora|rhel)
    yumdnf="yum"
    if test "$(echo "$VERSION_ID >= 22" | bc)" -ne 0; then
        yumdnf="dnf"
    sudo $yumdnf install java-1.8.0-openjdk
    fi
    ;;
arch|manjaro)
    echo "Please install jdk manually"
    exit 1
    ;;
*)
    unameOut="$(uname -s)"
    if [$unameOut == "Darwin"];then
    brew cask install adoptopenjdk8
    elif [$unameOut == "CYGWIN"];then
    echo "Please run download.bat!"
    else
    echo "Your machine isn't suport this bash script!"
    exit 1
    fi
    ;;
esac
command -v java >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "java is not installed properly"
    exit 1
else
    echo "succeed"
fi
else
echo "java is already installed!"

fi
command -v python3 >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Install Python...."
source /etc/os-release
case $ID in
debian|ubuntu|devuan)
    sudo apt-get install python3.8
    ;;
centos|fedora|rhel)
    yumdnf="yum"
    if test "$(echo "$VERSION_ID >= 22" | bc)" -ne 0; then
        yumdnf="dnf"
    sudo $yumdnf install -y python
    fi
    ;;
arch|manjaro)
    sudo pacman -S python
    ;;
*)
    unameOut="$(uname -s)"
    if [$unameOut == "Darwin"];then
    brew install python3
    elif [$unameOut == "CYGWIN"];then
    echo "Please run download.bat!"
    else
    echo "Your machine isn't suport this bash script!"
    exit 1
    fi
    ;;
esac
command -v python3 >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "python3 is not installed properly"
    exit 1
else
    echo "succeed"
fi
else
    echo "Python3 is already installed"
fi

