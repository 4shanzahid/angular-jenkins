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
              script{                    
                    sshagent(['54.201.213.162']) {
                    sh '''
                        rsync -rvze ssh /var/lib/jenkins/workspace/angualr-app_dev/dist/angular-jenkins/browser/* ubuntu@ec2-54-201-213-162.us-west-2.compute.amazonaws.com:/var/www/html/angular/ 
                        '''
                     }
                
                }
            }
        }
    }
}
