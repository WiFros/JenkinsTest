pipeline {
    agent any
    
    triggers {
        githubPush()
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                // 빌드 명령어를 여기에 추가하세요.
                sh './gradlew clean build'
            }
        }
        
        // 필요한 다른 스테이지를 추가할 수 있습니다.
    }
}
