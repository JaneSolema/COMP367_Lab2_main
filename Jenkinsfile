pipeline{
    agent any
    
    tools{
        maven "Maven3"
        jdk "JDK17"
        
    }
    
    stages{
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/JaneSolema/COMP367_Lab2_main.git'
               }
        }

         stage('Build Maven Project') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true clean package'
            }
        }
         stage('Docker Build') {
            steps {
               
                sh 'docker build -t jane2231/jane_repo:$BUILD_NUMBER .'
            }
        }
     stage('Docker Login and Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'

                    // Push the Docker image to Docker Hub
                    sh 'docker push jane2231/jane_repo:$BUILD_NUMBER'
                }
            }
        }
    }
}