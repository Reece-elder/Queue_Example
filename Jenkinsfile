pipeline{
        agent any
	
        stages{
            stage('Clone repo'){
                steps{
                    sh 'pwd'
                    sh 'sleep 3'
                    sh 'chmod a+x ./Queue_Example/DevOps/Jenkins/clone_repo.sh'
                    sh './Queue_Example/DevOps/Jenkins/clone_repo.sh'
                }
	        }
		
            stage('Build backend and push'){
                steps{
                    sh 'chmod a+x ./Queue_Example/DevOps/Jenkins/build_backend.sh'
                    sh './Queue_Example/DevOps/Jenkins/build_backend.sh'
                }
            }

            stage('Build frontend and push'){
                steps{
                    sh 'chmod a+x ./Queue_Example/DevOps/Jenkins/build_front.sh'
                    sh './Queue_Example/DevOps/Jenkins/build_front.sh'
                }
            }
	    
            stage('Deploy kubernetes cluster'){
                steps{
                        sh 'chmod a+x ./Queue_Example/DevOps/Jenkins/kubernetes.sh'
                        sh './Queue_Example/DevOps/Jenkins/kubernetes.sh'
                }

            }
	}    
}
