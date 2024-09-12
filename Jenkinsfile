pipeline {
    agent any

    stages {
       stage('Checkout') {
            steps {
              script{
                checkout scm
              }
            }
        }
        stage('Build') {
            steps {
              echo "Build"
            }
        }
      stage('Deploy') {
            steps {
              echo "Deploy"
            }
        }
    }
}
