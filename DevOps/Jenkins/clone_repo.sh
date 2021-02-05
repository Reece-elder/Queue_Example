 #! /bin/bash

 cd /home/jenkins/.jenkins/workspace/queue_project
 
sleep 2
if [ ! -d /home/jenkins/.jenkins/workspace/queue_project/Queue_Example ]; then
   git clone https://github.com/Reece-elder/Queue_Example.git -b jenkins
else 
   git pull https://github.com/Reece-elder/Queue_Example.git -b jenkins
fi

echo "*hacker voice* I'm in."