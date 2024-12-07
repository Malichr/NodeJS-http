pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("node-app:latest")
                }
            }
        }
        stage('Run Tests') {
            steps {
                echo 'No tests configured yet.'
            }
        }
        stage('Push to Registry') {
            steps {
                script {
                    docker.withRegistry('https://your-docker-registry', 'docker-credentials') {
                        docker.image("node-app:latest").push("latest")
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl apply -f k8s/deployment.yaml"
            }
        }
    }
}
