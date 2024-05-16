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
                sh './gradlew clean build'
            }
        }
        
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
        
        stage('Package') {
            steps {
                sh './gradlew bootJar'
            }
        }
        
        stage('Deploy') {
            steps {
                // 기존에 실행 중인 스프링 부트 애플리케이션 종료
                sh 'pkill -f *.jar || true'
        
                // 빌드된 JAR 파일을 서버의 특정 디렉토리로 복사
                sh 'cp build/libs/*.jar /path/to/deploy/'
        
                // 스프링 부트 애플리케이션을 백그라운드에서 실행
                sh 'nohup java -jar /path/to/deploy/*.jar > /dev/null 2>&1 &'
            }
        }
    }
    
    post {
        always {
            archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
            junit 'build/test-results/**/*.xml'
        }
    }
}
