pipeline {
  agent {
    label 'aws'
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('thestig90-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh "docker build -t thestig90/mysite-apache:build-$BUILD_ID ."
        sh "docker tag thestig90/mysite-apache:build-$BUILD_ID thestig90/mysite-apache:latest"
      }
    }
    stage('Login') {
      steps {
        sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
      }
    }
    stage('Push') {
      steps {
        sh "docker push thestig90/mysite-apache:build-$BUILD_ID"
        sh "docker push thestig90/mysite-apache:latest"
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}