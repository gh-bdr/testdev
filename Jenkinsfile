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
                     withCredentials([string(credentialsId: "argotest", variable: 'start')]) {
                        sh '''
                        
                        # Deploy to ArgoCD
                        ARGOCD_SERVER=138.68.74.105:31802 argocd --grpc-web app sync start --force
                        '''
               }
            }
        }
        
        
    }
}
