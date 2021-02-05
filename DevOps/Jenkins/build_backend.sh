 #! /bin/bash

 cd /home/ubuntu

. ./databasecredentials.sh

echo ${testvm_ip}

echo "database credentials exported"

ssh ubuntu@${testvm_ip} <<EOF

sleep 2
if [ ! -d /home/ubuntu/Queue_Example ]; then
   git clone https://github.com/Reece-elder/Queue_Example.git -b Jenkins
else 
   git pull https://github.com/Reece-elder/Queue_Example.git -b Jenkins
fi

cd ~/Queue_Example/Backend/barclays_example
mvn clean package | grep 'BUILD SUCCESS'

EOF