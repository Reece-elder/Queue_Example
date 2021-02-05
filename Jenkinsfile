pipeline{
        agent any
	
        stages{
            stage('Build backend and push'){
                steps{
                    sh 'pwd'
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
