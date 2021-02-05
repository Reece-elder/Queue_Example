#! /bin/bash

scp ~/databasecredentials.sh ubuntu@jenkinsvm_ip:~/
scp ~/databasecredentials.sh ubuntu@testvm_ip:~/

ssh ubuntu@jenkinsvm_ip <<EOF

git clone https://github.com/Reece-elder/Queue_Example.git -b Docker

# Export Database credentials
chmod +x ~/databasecredentials.sh
. ./databasecredentials.sh

# Importing SQL Schema
cd ~/Queue_Example/Database/
mysql -h ${db_endpoint} -P 3306 -u ${db_username} -p${password} < Create.sql

# Adding Jenkins to docker group
sudo usermod -aG docker jenkins

# Generate SSH KEy in Jenkins user
sudo su jenkins
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
EOF