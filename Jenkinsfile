pipeline {
    agent any

    environment {
        IMAGE_NAME = "dl-project"
        CONTAINER_NAME = "dl_project_container"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Show Version') {
            steps {
                echo "📦 Showing current version from version.txt"
                bat 'type version.txt'
            }
        }

        stage('Stop Old Container') {
            steps {
                bat 'docker stop %CONTAINER_NAME% || exit 0'
                bat 'docker rm %CONTAINER_NAME% || exit 0'
            }
        }

        stage('Run Container') {
            steps {
                echo "🚀 Deploying container"
                bat 'docker run -d -p 8888:8888 --name %CONTAINER_NAME% %IMAGE_NAME%'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment Successful 🚀'
        }
        failure {
            echo '❌ Deployment Failed'
        }
    }
}