 #! /bin/bash

 cd /home/ubuntu

. ./databasecredentials.sh

echo ${testvm_ip}

echo "database credentials exported"

ssh ubuntu@${testvm_ip} <<EOF
cd ~/.jenkins/workspace/queue_project/Backend/barclays_example
mvn clean package | grep 'BUILD SUCCESS'

EOF