pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'flutter pub get'
            }
        }
        stage('Deploy') {
            steps {
                sh 'flutter build apk'
            }
        }
    }
}
