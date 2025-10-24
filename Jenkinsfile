pipeline {
    agent any   // Use any available Jenkins agent

    environment {
        IMAGE_NAME = "myapp"
        IMAGE_TAG = "latest"
        CONTAINER_NAME = "myapp-container"
    }

    stages {

        stage('Checkout Repository') {
            steps {
                echo 'Cloning the GitHub repository...'
                // Use HTTPS URL or configure credentials if private
                git branch: 'main', url: 'https://github.com/Tejas-Repale/docker-jenkinscicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image ${env.IMAGE_NAME}:${env.IMAGE_TAG}"
                sh "docker build -t ${env.IMAGE_NAME}:${env.IMAGE_TAG} ."
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker container ${env.CONTAINER_NAME}"
                // Stop and remove existing container if exists
                sh """
                    if [ \$(docker ps -aq -f name=${env.CONTAINER_NAME}) ]; then
                        docker rm -f ${env.CONTAINER_NAME}
                    fi
                    docker run -d -p 8080:8080 --name ${env.CONTAINER_NAME} ${env.IMAGE_NAME}:${env.IMAGE_TAG}
                """
            }
        }
    }

    post {
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build failed! Check logs.'
        }
        always {
            // Optional: List running containers for verification
            sh 'docker ps'
        }
    }
}


