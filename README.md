# Cache---Redis---Memcached

**Agenda** :
To Deploy Memcache and Redis container on ECS Cluster.

**Prerequisites** :
1. Docker 
2. aws-cli 
3. aws cluster with 1 host having port 11211, 6379, 80, 443 and 22 open   

**How to use ?**
- Clone the repo
- To deploy Redis :
  Build Docker Image for Redis using Dockerfile present in the repo.
  Dockerfile uses scriptfile "insertData.sh" present in the repo to insert key-value pair to Redis at every 5 minutes.
  Use CF_template.yml to deploy the image on ECS cluster. Run :
  
  **aws cloudformation create-stack --stack-name <Name of the stack > --template-body file://CF_template.yml --parameters ParameterKey=,ParameterValue= .....**
  
- To deploy Memcache :
  Pull default docker image from docker hub using 
  
    **docker pull memcache:latest**
    
  Use CF_template.yml to deploy the image on ECS cluster. Run :
  
  **aws cloudformation create-stack --stack-name <Name of the stack > --template-body file://CF_template.yml --parameters ParameterKey=,ParameterValue= ......**
  
  
  
  
    
    
