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
                            // Bước 1: Build image (vẫn giữ nguyên vì đã chạy tốt)
                            bat "docker build -t ${env.DOCKER_IMAGE} ."

                            // Bước 2: Login và Push bằng lệnh bat để tránh lỗi context
                            withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                                // Login trực tiếp
                                bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                                // Push image lên Docker Hub
                                bat "docker push ${env.DOCKER_IMAGE}"
                            }
                        }
                    }
                }
    }
}