#! /bin/bash

#Update
sudo apt update

echo "installing unzip"
sudo apt install unzip -y
sleep 1

echo "installing wget"
sudo apt install unzip -y
sleep 1

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