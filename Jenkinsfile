pipeline {
    agent any

    environment {
        IMAGE_NAME = "electro-web"
        CONTAINER_NAME = "electro_container"
        PORT = "9999"
    }

    stages {

        stage('Pull from GitHub') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/babu120987/electro.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $IMAGE_NAME:1 .
                '''
            }
        }

        stage('Test Image') {
            steps {
                sh '''
                docker run --rm $IMAGE_NAME:1 nginx -t
                '''
            }
        }

stage('Run Container') {
    steps {
        sh '''
        docker rm -f electro_container || true
        docker run -d \
          --name electro_container \
          -p 10000:9999 \
          electro-web:1
        '''
    }
}
    }

    post {
        success {
            echo "✅ Deployment successful on port 9999"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
