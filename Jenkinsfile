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
    }
}
