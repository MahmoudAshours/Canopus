pipeline {
    agent {
        docker {
            image 'flutter:latest'
            args '-v /path/to/flutter/sdk:/flutter'
        }
    }
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
        stage('Release') {
            steps {
                sh 'flutter build apk --release'
                sh 'flutter build ios --release'
            }
        }
    }
}
