#!/bin/bash

banner()
{
  echo "+------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  echo "|                                          |"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
  echo "+------------------------------------------+"
}

banner "Installing all the required tools"

if ! command -v lolcat &> /dev/null
then
    read -p "lolcat not found, do you want to install Y/N?" input0
    if [[ $input0 -eq "Y" || $input0 -eq "y" ]]
    then
        echo "Installing lolcat in system just for nice font colorsss...."
        sudo apt-get install lolcat -y
        gem install lolcat
    else
        echo "Skipping this...."
    fi
fi

sleep 1

if ! command -v go &> /dev/null
then
    read -p "Go not found, do you want to install Y/N?" input1
    if [[ $input1 -eq "Y" || $input1 -eq "y" ]]
    then
    echo "Installing Go in system...."|lolcat
    wget https://golang.org/dl/go1.15.1.linux-amd64.tar.gz |lolcat
    sudo tar -C /usr/local -xzf go1.14.3.linux-amd64.tar.gz |lolcat
    echo "Setting env varaible..."|lolcat 
    sudo export PATH=$PATH:/usr/local/go/bin
    sudo export GOPATH=$HOME/go
    else
        echo "Skipping this...."
    fi
fi

sleep 1

if ! command -v anew &> /dev/null
then
    read -p "anew not found, do you want to install Y/N?" input2
    if [[ $input2 -eq "Y" || $input2 -eq "y" ]]
    then
        echo "Installing assetfinder in system...."|lolcat
        go get -u github.com/tomnomnom/anew
    else
        echo "Skipping this...."
    fi
fi

sleep 1

if ! command -v jq &> /dev/null
then
    read -p "jq not found, do you want to install Y/N?" input0
    if [[ $input0 -eq "Y" || $input0 -eq "y" ]]
    then
        echo "Installing jq in system..."
        sudo apt-get jq lolcat -y
    else
        echo "Skipping this...."
    fi
fi

sleep 1

if ! command -v assetfinder &> /dev/null
then
    read -p "assetfinder not found, do you want to install Y/N?" input2
    if [[ $input2 -eq "Y" || $input2 -eq "y" ]]
    then
        echo "Installing assetfinder in system...."|lolcat
        go get -u github.com/tomnomnom/assetfinder
    else
        echo "Skipping this...."
    fi
fi

sleep 1

if ! command -v findomain &> /dev/null
then
    read -p "findoomain not found, do you want to install Y/N?" input3
    if [[ $input3 -eq "Y" || $input3 -eq "y" ]]
    then
        echo "Installing findomain in system...."|lolcat 
        wget https://github.com/Edu4rdSHL/findomain/releases/download/2.1.3/findomain-linux |lolcat
        sudo mv findomain-linux /usr/local/bin/findomain
    else
        echo "Skipping this...."
    fi
fi

sleep 1

if ! command -v subfinder &> /dev/null
then
    read -p "subfinder not found, do you want to install Y/N?" input2
    if [[ $input2 -eq "Y" || $input2 -eq "y" ]]
    then
        echo "Installing subfinder in system...."|lolcat
        GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
    else
        echo "Skipping this...."
    fi
fi

sleep 1

if ! command -v amass &> /dev/null
then
    read -p "amass not found, do you want to install Y/N?" input5
    if [[ $input5 -eq "Y" || $input5 -eq "y" ]]
    then
        echo "Installing amass in system...."|lolcat
        sudo apt-get install amass -y |lolcat
    else
        echo "Skipping this...."
    fi
fi

sleep 1

if ! command -v httprobe &> /dev/null
then
    read -p "httprobe not found, do you want to install Y/N?" input6
    if [[ $input6 -eq "Y" || $input6 -eq "y" ]]
    then
        echo "Installing httprobe in system...."|lolcat
        go get -u github.com/tomnomnom/httprobe
    else
        echo "Skipping this...."
    fi
fi
