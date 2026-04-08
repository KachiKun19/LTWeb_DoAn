pipeline {
    agent any

    tools {
        // 'maven' là tên bạn đã đặt trong Manage Jenkins > Tools
        maven 'maven'
    }

    environment {
        // Hãy thay "kachingo/ttweb-deploy" bằng [Tên Docker Hub của bạn]/[Tên Repo]
        DOCKER_IMAGE = "kachingo/web_test:latest"
        DOCKER_CREDENTIALS_ID = 'docker-hub-creds'
    }

    stages {
        stage('Maven Build') {
            steps {
                // Lệnh 'bat' dành cho Windows
                bat 'mvn clean package'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    docker.build(env.DOCKER_IMAGE)
                    docker.withRegistry('', env.DOCKER_CREDENTIALS_ID) {
                        docker.image(env.DOCKER_IMAGE).push()
                    }
                }
            }
        }
    }
}