pipeline {
    agent any   // use any available Jenkins agent (node)

    stages {

        stage('Clone Repository') {
            steps {
                echo ' Cloning the GitHub repository...'
                git branch: 'main', url: 'https://github.com/Tejas-Repale/docker-jenkinscicd.git
            }
        }

        stage('Build Docker Image') {
            steps {
                echo ' Building Docker image...'
                sh 'docker build -t myapp:latest .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo ' Running the Docker container...'
                sh 'docker run -d -p 8080:8080 myapp:latest'
            }
        }
    }

    post {
        success {
            echo ' Build and deployment successful!'
        }
        failure {
            echo ' Build failed! Check logs.'
        }
    }
}

