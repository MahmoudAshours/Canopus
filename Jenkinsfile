pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'flutter pub get'
            }
        }
        stage('Test') {
            steps {
                sh 'flutter test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'flutter build apk'
            }
        }
    }
}
