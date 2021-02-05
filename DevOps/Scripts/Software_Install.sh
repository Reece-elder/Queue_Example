#! /bin/bash

#Update
sudo apt update

echo "installing unzip"
sudo apt install unzip -y
sleep 1

echo "installing wget"
sudo apt install unzip -y
sleep 1

#Install jq
if ! which jq > /dev/null; then
        echo "Installing jq"
        sleep 1
        sudo apt install jq -y
else
        echo "jq already exist"

fi

#Install python3
if ! which python3 > /dev/null; then
	echo "Installing Pyton3"
	sleep 1
	sudo apt install python3 -y
else
        echo "python3 already exist"

fi

#Install python3-pip
if ! which pip3 > /dev/null; then
        echo "Installing python3-pip"
        sleep 1
        sudo apt install python3-pip -y
else
        echo "python3-pip already exist"

fi

#Install terraform
if ! which terraform > /dev/null; then
        echo "Installing terraform"
        sleep 1
	wget https://releases.hashicorp.com/terraform/0.14.5/terraform_0.14.5_linux_amd64.zip
        unzip terraform_*_linux_*.zip
	sudo mv terraform /usr/local/bin
	rm terraform_*_linux_*.zip
else
        echo "terraform already exist"

fi

#install curl
echo "installing Curl"
sudo apt install curl -y
sleep 1

#Install awscli
if [ ! -d ~/aws ]; then
        echo "Installing awscli"
        sleep 1
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
	mv ./aws ~/aws
	rm awscliv2.zip
else
        echo "awscli already exist"

fi

if [ ! -f ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
else
  echo "Public key already exist"
fi

#Install ansible
if ! which ansible > /dev/null; then
        echo "Installing ansible"
        sleep 1
        sudo apt install software-properties-common
        sudo apt-add-repository --yes --update ppa:ansible/ansible
        sudo apt install ansible
else
        echo "ansible already exist"

fi