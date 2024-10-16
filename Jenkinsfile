pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git '
https://github.com/ShivangiAggarwal07/shivitestgit'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def customImage = docker.build("sinhatestimage")
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    docker.image("sinhatestimage").run('-p 5000:5000')
                }
            }
        }
    }
    post {
        always {
            // Clean up after build
            cleanWs()
        }
    }
}
