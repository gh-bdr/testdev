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
                    docker.withRegistry('https://registry.digitalocean.com/pixi', 'test') {

                        def customImage = docker.build("pixi/my-image:${env.BUILD_ID}")

                        customImage.push()
                    }
                   
                }
            }
        }
    }
}
