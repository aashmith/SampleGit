pipeline {
    agent any

    environment {
        // Define environment variables here, if needed
        APP_NAME = 'my-app'
        DEPLOY_ENV = 'staging'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your version control system
                git url: 'https://github.com/your-repo/my-app.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                // Run build commands, e.g., using Maven, Gradle, npm, etc.
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                // Run tests, e.g., unit tests, integration tests
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                // Deploy the application to the specified environment
                sh """
                echo "Deploying ${APP_NAME} to ${DEPLOY_ENV} environment..."
                # Add your deployment commands here
                """
            }
        }
    }

    post {
        always {
            // Actions that are always run at the end of the pipeline, regardless of success or failure
            echo 'Pipeline completed.'
        }
        success {
            // Actions to perform when the pipeline succeeds
            echo 'Pipeline succeeded.'
        }
        failure {
            // Actions to perform when the pipeline fails
            echo 'Pipeline failed.'
        }
    }
}
