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