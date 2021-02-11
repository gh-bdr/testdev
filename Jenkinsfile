pipeline {
    agent none

    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            agent {
                docker{
                    image 'node:14.15.4-alpine3.11'
                    args '-v $HOME/.m2:/root/.m2'
                }
            }
            steps {
                echo 'Compiling nodejs app'
               
            }
        }

        stage('Test') {
            agent {
                docker{
                    image 'node:14.15.4-alpine3.11'
                    args '-v $HOME/.m2:/root/.m2'
                }
            }
            steps {
                echo 'Testing'
                
            }
        }

        stage('docker-package'){
            agent any
            when {
                anyOf { branch 'master'; branch 'staging'; branch 'dev' }
            }
            steps{
                echo 'building'
                script {
                    docker.withRegistry("registry.digitalocean.com/pixi" , 'DO-registry') {
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
