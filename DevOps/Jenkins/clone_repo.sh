 #! /bin/bash
 
sleep 2
if [ ! -d /home/jenkins/.jenkins/workspace/queue_project/Queue_Example ]; then
   git clone https://github.com/Reece-elder/Queue_Example.git -b dev
else 
   rm -rf Queue_Example
   git clone https://github.com/Reece-elder/Queue_Example.git -b dev
fi

echo "*hacker voice* I'm in."