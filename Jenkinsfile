pipeline {
  agent any 
  stages {
   
      stage('Build Docker Image') {
        steps {
          sh './run_docker.sh'
            }
        }
      stage('Upload Docker Image') {
          steps {
            sh './upload_docker.sh'
              }
        }
      
      }
    }
  
