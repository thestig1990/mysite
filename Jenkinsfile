pipeline {
  agent {
    label 'none'
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('thestig90-dockerhub')
  }
  parameters {
    string(name: 'username', defaultValue: 'ec2-user', description: 'user name for the remote awc ec2 instance')
    string(name: 'hostname', defaultValue: '18.194.44.156', description: 'host name for the remote awc ec2 instance')
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
        sh 'scp deploy.sh ${params.username}@${params.hostname}:/home/ec2-user'
        sh 'ssh ${params.username}@${params.hostname} "chmod +x deploy.sh"'
        sh 'ssh ${params.username}@${params.hostname} ./deploy.ssh'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}