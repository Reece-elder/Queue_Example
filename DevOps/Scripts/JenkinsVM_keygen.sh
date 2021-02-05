#! /bin/bash

scp ~/databasecredentials.sh ubuntu@jenkinsvm_ip:~/
scp ~/databasecredentials.sh ubuntu@testvm_ip:~/

ssh ubuntu@jenkinsvm_ip <<EOF
sudo usermod -aG docker jenkins
sudo su jenkins
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
EOF