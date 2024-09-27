pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
              docker.withRegistry('', 'docker-cred') {
              def angularapp = docker.build("5shan/angular-docker:2.0")
              angularapp.push()
              }
            }
        }

        stage('Deploy') {
            steps {
                sshagent(['54.201.213.162']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no ec2-52-33-245-19.us-west-2.compute.amazonaws.com "docker run -d -p 4200:4200 5shan/angular-docker:2.0"
                    '''
                }
            }
        }
    }
}
