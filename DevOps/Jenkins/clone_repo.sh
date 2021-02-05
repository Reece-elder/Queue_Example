 #! /bin/bash
echo "===== Location ====="
pwd
echo "===== Location ====="
sleep 2
cd /var/lib/jenkins/workspace/queue_project
if [ ! -d /var/lib/jenkins/workspace/queue_project/Queue_Example ]; then
   git clone https://github.com/Reece-elder/Queue_Example.git -b Dev
else 
   rm -rf Queue_Example
   git clone https://github.com/Reece-elder/Queue_Example.git -b Dev
fi

echo "*hacker voice* I'm in."