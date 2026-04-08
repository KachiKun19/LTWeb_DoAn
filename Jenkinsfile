pipeline {
    agent any

    environment {
        // THAY ĐỔI: Tên repo Docker Hub của bạn (ví dụ: kachingo/ttweb-deploy)
        DOCKER_IMAGE = "kachingo/ttweb-deploy:latest"
        DOCKER_CREDENTIALS_ID = 'docker-hub-creds'
    }

    stages {
        stage('Maven Build') {
            steps {
                // Đóng gói code thành file .war
                bat 'mvn clean package'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    // Build image từ Dockerfile
                    docker.build(env.DOCKER_IMAGE)

                    // Push lên Docker Hub để Render có thể lấy về
                    docker.withRegistry('', env.DOCKER_CREDENTIALS_ID) {
                        docker.image(env.DOCKER_IMAGE).push()
                    }
                }
            }
        }
    }
}