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
                    sh "mkdir deploy && cd deploy"
                    git credentialsId: 'gh-bdr test repo', url: 'git@github.com:gh-bdr/writejenkins.git'
                    sh "ls -lart ./*"
                    sh "touch index.css"
                    sh "git add . && git commit -m 'Update guestbook to v2.0'"
                    sh "git push"
                }
            }
        }
        
        
   
        
        
    }
}
