pipeline {
    agent none

    environment {
        CI = 'true'
    }
    stages {


        stage('docker-package'){
            agent {
                docker{ image 'gharbibdr/argocli' }
            }
            steps{
                echo 'deploy now'
                script {
                    
                    withCredentials([string(credentialsId: "jenkins-argocd-authToken", variable: 'ARGOCD_AUTH_TOKEN')]) {
                    sh "/argocd app sync start"
                    }
                    
                    
                    withCredentials([string(credentialsId: 'argopass', variable: 'USERPASS')]) {
                        sh 'argocd login 51.77.141.51:30001 --username admin --password $USERPASS --insecure && argocd account list'
                        sh 'argocd account list'    
                            
                            
                    
                    }

                    
                }
            }
        }
        
        
   
        
        
    }
}
