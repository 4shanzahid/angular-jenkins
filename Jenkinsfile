pipeline {
    agent any

    stages {
       stage('Checkout') {
            steps {
              checkout scm
            }
        }
        stage('Build and push') {
            steps {
              sh "docker build -t angular-docker ."
              sh "docker tag angular-docker 5shan/angular-docker:2.0"
              sh "docker push 5shan/angular-docker:2.0"
            }
        }
      stage('Deploy') {
            steps {
              sshagent(['54.201.213.162']) {
                    sh '''
                     ssh -o StrictHostKeyChecking=no ec2-52-33-245-19.us-west-2.compute.amazonaws.com"
                     docker run -d -p 8080:8080 5shan/angular-docker:2.0
                        '''
                     }
            }
        }
    }
}
