pipeline {
    agent none

    environment {
        CI = 'true'
        registry = "registry.digitalocean.com/pixi"
        registryCredential = 'DO-registry'
    }
    stages {


        stage('docker-package'){
            agent any
            steps{
                echo 'building'
                script {
                    withDockerRegistry('registry.digitalocean.com/pixi', 'test') {
                        echo 'buildinginside'
                        def workerImage = docker.build("startadmin-${env.BRANCH_NAME}:v${env.BUILD_ID}")
                        workerImage.push()
                    }
                }
            }
        }

        stage('Deploy for development') {
            when {
                branch 'dev' 
            }
            steps {
                 echo 'Deploy for development'
            }
        }
        
        stage('Deploy for Pre-prod') {
            when {
                branch 'staging'  
            }
            steps {
                echo 'Deploy for Pre-prod'
            }
        }
    }
    post{
        always {
            echo 'pipeline is complete..'
        }
        failure {
            echo 'add notification to slack and/or email' 
        }
    }
}
