pipeline {
    agent none

    environment {
        CI = 'true'
    }
    stages {


        stage('docker-package'){
            agent any
            steps{
                echo 'building now'
                script {
                    git credentialsId: 'argotest', url: 'https://github.com/gh-bdr/writejenkins.git'
                    cd writejenkins
                    touch index.css
                    git add . -m "Update guestbook to v2.0"
                    git push
                }
            }
        }
        
        
   
        
        
    }
}
