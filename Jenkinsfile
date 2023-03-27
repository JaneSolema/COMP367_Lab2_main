pipeline{
    agent any
    
    tools{
        maven "Maven3"
        jdk "JDK17"
        
    }
    
    stages{
        stage('Build') {
            steps {
                git branch: 'main', url: 'https://github.com/JaneSolema/COMP367_Lab2_main.git'
               }
        }

        stage("Build Maven Project") {
            steps {
                bat 'mvn clean compile package'
            }
        }
         stage('Docker Build') {
            steps {
                // Build the Docker image with the compiled WAR file
                sh 'docker build -t jane2231/jane_repo:$BUILD_NUMBER .'
            }
        }
     stage('Docker Login and Push') {
            steps {
                // Log in to Docker Hub using the credentials you added to Jenkins Credentials
                withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'

                    // Push the Docker image to Docker Hub
                    sh 'docker push jane2231/jane_repo:$BUILD_NUMBER'
                }
            }
        }
    }
}