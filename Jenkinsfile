pipeline {
    agent none

    environment {
        CI = 'true'
    }
    stages {


        stage('docker-package'){
            agent any
            steps{
                echo 'building'
                script {
                    docker.withRegistry('https://registry.digitalocean.com/pixi', 'test') {
                        def customImage = docker.build("pixi/start:${env.BRANCH_NAME}-${env.BUILD_ID}")
                        customImage.push()
                    }
                   
                }
            }
        }
        
        
        stage ('Deploy_K8S') {
            agent any
            steps {
 
                withCredentials([string(credentialsId: 'argotest', variable: 'ARGOCD_AUTH_TOKEN')]) {
                    curl -sSL -o /usr/local/bin/argocd https://${ARGOCD_SERVER}/download/argocd-linux-amd64
                    argocd app sync guestbook
                    argocd app wait guestbook
                }
                    
            }
        }
        
        
    }
}
