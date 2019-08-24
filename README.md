# CI-DOCKER-KUBE-AWS

[![Build Status](http://ec2-18-219-86-226.us-east-2.compute.amazonaws.com:8080/buildStatus/icon?job=Weather-app)](http://ec2-18-219-86-226.us-east-2.compute.amazonaws.com:8080/job/Weather-app/)

Simple ngnix webserver running kubernetes pods in aws. The app shows a simple weather page.

 * To build docker image, run ./run_docker.sh

 * Docker Image is hosted in Dockerhub. The image is sage007/weather-ngnix 
 

 * To run app using kubernetes, run ./run_kubernetes.sh

 * Any changes to the repo will trigger jenkins build, which runs a linter for html, and runs unit test.

Artifacts:
 * Jenkinsfile contains build steps
 
 * EKS clusters can be spun in  AWS service using ./create.sh
 
Rolling Updates:
 
 * Rolling updates can be made by running  `kubectl apply -f kubernetes/deployment.yml`
 
 * Rolling update is defined in kubernetes/deployment.yml
 
 * To perform rolling update, change the version in deployment to a newer version, like v3m or change the container image.
 
 * To perfrom a rollout, following command was issued, and the site got restored to the previous version. `kubectl rollout undo deployment/ngnix`
 


kubernetes Cluster

 
 * To build kubernetes deployment, and service in AWS, run `kubectl create -f deployment.yaml && 
kubectl create -f service.yml` commands from the kubernetes directory. 

 How to update the site?
 
 * Push changes to git, it will trigger a  build pipeline that runs tests, and lints the source codes. If build passes, docker image is uploaded, and a ngnix site is build. When the build step passes, kubernetes can be run on the clusters created by cloudformation command. Note: at this point, kubectl is run locally, but this could also be part of the build pipeline.  
