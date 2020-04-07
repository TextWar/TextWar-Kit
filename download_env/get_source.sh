#!/usr/bin/env bash
#by magiclu
command -v mvn >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "downloading the maven"
    wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
    tar -xvf apache-maven-3.6.3-bin.tar.gz
    cd apache-maven-3.6.3
    path=$(pwd)
    export PATH="${path}:${PATH}"

    unameOut="$(uname -s)"
    if [$unameOut == "Darwin"];then
       source ~/.bash_profile
    else
       source /etc/profile
    fi
fi
wget https://github.com/TextWar/TextWar/archive/master.zip
cd master
unzip master.zip
rm -f master.zip
cd TextWar-master
cd textwar_pom
mvn clean compile package install
cd ..
cd textwar
mvn clean compile package install
cd ..
cd textwar_protocol
mvn clean compile package install
cd ..
cd textwar_plugin
mvn clean compile package install
cd ..
cd textwar_console
mvn clean compile package install
cd ..
cd textwar_client_connector
mvn clean compile package install
cd ..
cd ..
mv TextWar-master/textwar_client_connector/target/textwar_client_connector-1.0.jar textwar_server.jar
rm -rf TextWar-master