pipeline {
    agent any

    environment {
        IMAGE_NAME = "shivitestimg"
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Cloning the Git repository
                git 'https://github.com/ShivangiAggarwal07/shivitestgit/'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image from the Dockerfile in the repo
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Run Docker Container') {
    steps {
        script {
            // Convert Windows path format to Unix format for Docker
            def workspaceUnixPath = pwd().replace('\\', '/').replaceAll('C:', '/c')
            
            // Run the Docker container using the converted path
            docker.image("${IMAGE_NAME}").inside("--workdir ${workspaceUnixPath}") {
                sh 'python3 train.py'
            }
        }
    }
}
