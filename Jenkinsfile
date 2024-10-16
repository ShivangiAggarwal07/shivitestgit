pipeline {
    agent any  // Run the pipeline on any available Jenkins agent
 
    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository from GitHub
                git 'https://github.com/ShivangiAggarwal07/shivitestgit'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the repository
                    def customImage = docker.build("sinhatestimage")
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container, mapping port 5000
                    customImage.run('-p 5000:5000')
                }
            }
        }
    }
    post {
        always {
            // Clean up workspace after the build
            cleanWs()
        }
    }
}
