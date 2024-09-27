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
              sh "docker build -t angular-docker ."
              sh "docker tag angular-docker 5shan/angular-docker:2.0"
            }
        }

      stage('push') {
            steps {
              withCredentials([usernamePassword(credentialsId:'docker-cred', usernameVariable:'USER', passwordVariable:'PASS')]){
                sh "docker login -u $USER -p $PASS"
                sh "docker push 5shan/angular-docker:2.0"
              }
            }
        }
      
      stage('Deploy') {
            steps {
              sshagent(['54.201.213.162']) {
                    sh '''
                     ssh -o StrictHostKeyChecking=no ec2-52-33-245-19.us-west-2.compute.amazonaws.com"
                     docker run -d -p 4200:4200 5shan/angular-docker:2.0
                        '''
                     }
            }
        }
    }
}
