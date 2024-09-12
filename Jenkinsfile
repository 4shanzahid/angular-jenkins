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
              sh "npm install"
              sh "ng build"
            }
        }
      stage('Deploy') {
            steps {
              echo "Deploy"
            }
        }
    }
}
