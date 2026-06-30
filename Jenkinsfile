pipeline {
    agent any

    environment {
        IMAGE_NAME = "php-vpms"
        CONTAINER_NAME = "php-vpms-container"
        HOST_PORT = "8085"
        CONTAINER_PORT = "80"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t ${IMAGE_NAME}:latest .
                """
            }
        }

        stage('Remove Old Container') {
            steps {
                sh """
                docker stop ${CONTAINER_NAME} || true
                docker rm ${CONTAINER_NAME} || true
                """
            }
        }

        stage('Run Docker Container') {
            steps {
                sh """
                docker run -d \
                --name ${CONTAINER_NAME} \
                -p ${HOST_PORT}:${CONTAINER_PORT} \
                ${IMAGE_NAME}:latest
                """
            }
        }

        stage('Verify Container') {
            steps {
                sh """
                docker ps
                """
            }
        }
    }

    post {
        success {
            echo "Docker Image Built Successfully!"
            echo "Application is running on port ${HOST_PORT}"
        }

        failure {
            echo "Pipeline Failed!"
        }
    }
}
