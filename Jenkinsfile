pipeline {
  agent 'any'
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
      }
    }
  }
}