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
                    withCredentials([usernameColonPassword(credentialsId: 'argocdpass', variable: 'USERPASS')]) {
                        sh '''
                            argocd login 51.77.141.51:30001 --username bdr --password $USERPASS --insecure
                            argocd account list
                         '''   
                    }
                    
                }
            }
        }
        
        
   
        
        
    }
}
