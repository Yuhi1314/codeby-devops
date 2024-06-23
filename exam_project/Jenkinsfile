pipeline {
  agent any

  environment {
    registry = "yuhi1314/phpk8s"
    registry_fl = "yuhi1314/fluentd-agent"
    registryCredential = '18ae2b99-8309-4c65-a727-c424f1fd8e71'
    dockerImage = ''
  }
  tools {
    jdk 'jdk11'
    maven 'maven'
  }

  stages {
    stage("Git Checkout") {
      steps {
        script {
          git branch: 'exam', url: 'https://github.com/yuhi1314/exam_project.git'
        }
      }
    }

    stage("Maven Build") {
      steps {
        script {
          sh "mvn clean install -T 1C" // -T 1C is used to speed up the build using multithreading
        }
      }
    }
    
    stage("Test Cases") {
      steps {
        sh "mvn test"
      }
    }

    stage('Building our image') {
      steps {
        script  {
          dir('exam_project') {
            dockerImage = docker.build("${registry}:${BUILD_NUMBER}")
            docker.withRegistry('', registryCredential) {
              dockerImage.push()
            }
          }
        }
      }
    }

    stage('Building our image with Dockerfile in fluentd folder') {
      steps {
        script {
          dir('fluentd') {
            dockerImage = docker.build("${registry_fl}:${BUILD_NUMBER}")
            docker.withRegistry('', registryCredential) {
              dockerImage.push()
            }
          }
        }
      }
    }

    stage("Apply the Kubernetes files") {
      steps {
        script {
          sh "kubectl apply -f kubernetes/"
        }
      }
    }

    stage("Apply the Kubernetes files for monitoring") {
      steps {
        script {
          sh "kubectl apply -f monitoring/"
        }
      }
    }
  }
}