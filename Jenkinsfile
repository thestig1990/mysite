pipeline {
  agent {
    label 'none'
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('thestig90-dockerhub')
    REMOTE_HOST='ec2-user'
    REMOTE_HOST='18.194.44.156'
  }
  stages {
    stage('Login') {
      steps {
        sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
      }
    }
    stage('Pull') {
      steps {
        sh "docker pull thestig90/mysite-apache:build-9"
      }
    }
    stage('Deploy') {
      steps {
        sh "scp ${REMOTE_USER}@${REMOTE_HOST}:/home/ec2-user"
        sh "ssh ${REMOTE_USER}@${REMOTE_HOST} 'chmod +x deploy.sh'"
        sh "ssh ${REMOTE_USER}@${REMOTE_HOST} ./deploy.ssh"
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}