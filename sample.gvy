pipeline {
    agent any

    stages {
        stage('Hello Stage') {
            steps {
                script {
                    echo 'Hello'
                }
            }
        }
    }
}
