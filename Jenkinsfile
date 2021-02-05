pipeline{
        agent any
	
        stages{
            stage('Clone repo'){
                steps{
                    sh 'pwd'
                    sh 'sleep 3'
                    sh 'chmod a+x ./DevOps/Jenkins/clone_repo.sh'
                    sh './DevOps/Jenkins/clone_repo.sh'
                }
	        }
		
            stage('Build backend and push'){
                steps{
                    sh 'chmod a+x ./DevOps/Jenkins/build_backend.sh'
                    sh './DevOps/Jenkins/build_backend.sh'
                }
            }

            stage('Build frontend and push'){
                steps{
                    sh 'chmod a+x ./DevOps/Jenkins/build_front.sh'
                    sh './DevOps/Jenkins/build_front.sh'
                }
            }
	    
            stage('Deploy kubernetes cluster'){
                steps{
                        sh 'chmod a+x ./DevOps/Jenkins/kubernetes.sh'
                        sh './DevOps/Jenkins/kubernetes.sh'
                }

            }
	}    
}
