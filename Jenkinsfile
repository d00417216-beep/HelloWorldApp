pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/d00417216-beep/HelloWorldApp.git'
      }
    }
    stage('Compile') {
      steps {
        sh 'javac helloworld.java'
      }
    }
    stage('Run') {
      steps {
        sh 'java helloworld'
      }
    }
    stage('Docker Build') {
      steps {
        sh 'docker build -t java-hello-world:latest .'
      }
    }
    stage('Docker Run') {
      steps {
        sh 'docker run --rm java-hello-world:latest'
      }
    }
    stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'my-docker-hub-credentials-id', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          // login to DockerHub
          sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
          // tag the image with your DockerHub repo name
          sh 'docker tag java-hello-world:latest $DOCKER_USER/helloworldapp:latest'
          // push the image
          sh 'docker push $DOCKER_USER/helloworldapp:latest'
        }
      }
    }
  }
}

