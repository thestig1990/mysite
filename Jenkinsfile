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
        sh 'docker build -t thestig/mysite-apache:build-${env.BUILD_ID} .'
      }
    }
  }
}
