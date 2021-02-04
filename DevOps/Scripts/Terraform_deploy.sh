#! /bin/bash

cd /home/ubuntu/Queue_Example/DevOps/Terraform
terraform fmt
terraform init
terraform plan
terraform apply -auto-approve

echo "terraform finished"

#Export output ip addresses into variables to help mask secrets and prevent them from being pushed to git hub

export jenkinsvm_ip="$(terraform output jenkinsvm_ip)"
export jenkinsvm_ip=$(echo ${jenkinsvm_ip} | jq -r .)
export testvm_ip="$(terraform output testvm_ip)"
export testvm_ip=$(echo ${testvm_ip} | jq -r .)

echo "export terraform ip addresses into vars done"

cd ~

sudo -- sh -c -e "echo '${testvm_ip} testvm_ip' >> /etc/hosts";

sudo -- sh -c -e "echo '${jenkinsvm_ip} jenkinsvm_ip' >> /etc/hosts";

echo "Passing terraform ip outputs to hosts done"

export db_endpoint="$(terraform output rds_endpoint_prod)"
export db_endpoint=$(echo ${db_endpoint} | jq -r .)
export db_endpoint=$(echo ${db_endpoint} | sed 's/:3306//')

echo "export terraform rds endpoints into vars done"

# Exporting Secrets data
cd ~
chmod +x ~/Secrets/cred.sh
. ./secrets/cred.sh

# Creating Credentials file
cd ~
touch databasecredentials.sh
chmod +x databasecredentials.sh

echo "#! /bin/bash" >> ~/databasecredentials.sh

echo "export db_endpoint=${db_endpoint}" >> ~/databasecredentials.sh
echo "export db_username=${db_username}" >> ~/databasecredentials.sh
echo "export password=${password}" >> ~/databasecredentials.sh
echo "export testvm_ip=${testvm_ip}" >> ~/databasecredentials.sh
echo "export testvm_ip=${jenkinsvm_ip}" >> ~/databasecredentials.sh
echo "export DOCKER_USERNAME=${DOCKER_USERNAME}" >> ~/databasecredentials.sh
echo "export DOCKER_PASSWORD=${DOCKER_PASSWORD}" >> ~/databasecredentials.sh
