pipeline {
  agent any 
  stages {
      stage('Lint HTML'){
      steps{
         sh 'tidy -q -e index.html'
        }
      }
   
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
      stage('Run Integration Test to check the site') {
            steps {
              sh '''#!/bin/bash
                if curl -s "http://ec2-18-219-86-226.us-east-2.compute.amazonaws.com/" | grep "This is a weather app"
                  then
                  # if the keyword is in the conent
                    echo " the website is working fine"
                  exit 0 
                else
                  echo "Error"
                  exit 1
                fi
                '''
               }
          }

      }
    }
  
