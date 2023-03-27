pipeline {
  agent {
    label 'controller'
  }
  triggers {
    upstream "DockerHub-push_image"
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('thestig90-dockerhub')
  }
  parameters {
    string(name: 'username', defaultValue: 'ec2-user', description: 'user name for the remote awc ec2 instance')
    string(name: 'hostname', defaultValue: '18.196.72.210', description: 'host name for the remote awc ec2 instance')
  }
  stages {
    stage('Login') {
      steps {
        sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
      }
    }
    /*stage('Pull') {
      steps {
        sh "docker pull thestig90/mysite-apache:latest"
      }
    } */
    stage('Deploy') {
      steps {
        sh 'scp deploy.sh ${username}@${hostname}:/home/ec2-user'
        sh 'ssh ${username}@${hostname} "chmod +x deploy.sh"'
        sh 'ssh ${username}@${hostname} /home/ec2-user/deploy.sh'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}