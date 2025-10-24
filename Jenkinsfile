pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        CONTAINER_NAME = "myapp-container"
        HOST_PORT = "8081" // Change if port conflict occurs
        CONTAINER_PORT = "8080"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git url: 'https://github.com/Tejas-Repale/docker-jenkinscicd.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image ${IMAGE_NAME}:latest"
                sh '''
                # Use host network for internet access during build
                docker build --network=host -t ${IMAGE_NAME}:latest .
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker container ${CONTAINER_NAME}"

                sh '''
                # Stop and remove container if already exists
                if [ $(docker ps -aq -f name=${CONTAINER_NAME}) ]; then
                    docker rm -f ${CONTAINER_NAME}
                fi

                # Run container
                docker run -d -p ${HOST_PORT}:${CONTAINER_PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME}:latest
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed! Check logs."
            sh 'docker ps -a'
        }
    }
}

