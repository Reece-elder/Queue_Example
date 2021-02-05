 #! /bin/bash

 echo "it works"

/home/ubuntu/databasecredentials.sh

ssh ubuntu@$testvm_ip <<EOF
echo "I'm Sshed in"
cd ~
/home/ubuntu/databasecredentials.sh

if [ ! -d /home/jenkins/.jenkins/workspace/queue_project/Queue_Example ]; then
   git clone https://github.com/Reece-elder/Queue_Example.git -b dev
else 
   rm -rf Queue_Example
   git clone https://github.com/Reece-elder/Queue_Example.git -b dev
fi

cd ~/Group-3-Final-Project/Spring-HelpQueue
mvn clean package | grep 'BUILD SUCCESS'

EOF