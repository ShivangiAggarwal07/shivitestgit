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
                    // Run the Docker container
                    docker.image("${IMAGE_NAME}").inside {
                        // This runs commands inside the container.
                        // You can run your application or tests here.
                        sh 'python3 train.py'
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after pipeline completion
            cleanWs()
        }
    }
}
