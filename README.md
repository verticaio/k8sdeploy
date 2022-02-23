# Simple Python App CI and K8s Deployment Flow 
![Alt text](img/flow.png?raw=true "Architecture Diagram")

## About
This repo contains simple python flask app ci processs, deployment to kubernetes minikube and guide of environment setup

## Tools List
- Github
- Linux Ubuntu
- Jenkins
- Docker
- Minikube
- HelmChart
- Nginx

## Local  App Testing
```
git clone https://github.com/verticaio/k8sdeploy.git
docker build -t python-flask-docker .
docker run --name python-flask-docker   -d -p 8080:8080 python-flask-docker  
curl http://localhost:8080
```
  
## Technical steps
``` 
# Login to Linux VM
git clone https://github.com/verticaio/k8sdeploy.git
cd k8sdeploy/infra/setup 
chmod +x public_nginx.sh setup-req.sh
./setup-req.sh
``` 
Configure Jenkins UI, install required plugins and .etc. <br />
Deploy App minikube k8s from jenkins <br />
Apply Nginx Configuration for accesing from web browser
``` 
# Login to Linux VM
cd k8sdeploy/infra/setup 
./public_nginx.sh
``` 
## Open browser and go to below links
[Jenkins Endpoint ](http://20.105.187.250:8080/) <br />
[App Endpoint](http://20.105.187.250:8081/) <br />

## Pipeline trigger flow 
Jenkins Webhook triggered when you push something to main branch of repo.  

##  Improvement plan: 
1. Automate Linux OS stuff with Ansible
2. Prepare docker-compose  for Local development
3. Use Nexuso Harbor for Docker images and  Helm Charts
4. Add Testing stages CI/CD - unit, integraation, e2e and contract testing  
5. Implement makefiles  for easy management repo
6. Implement Sops encryption for encrypt sensitive data in under repo 
7. Use kaniko for bulding docker image without need docker daemon
8. Impelement  Security in CI/CD (Sonarqube, Docker,Code Scanning and Owaps10 after deploy) 
9.  Multibranh pipeline  and shared libs with groovy in jenkins and implement conditional based branch deploy(GitFlow, Trunk Based Development)
10. Notify Jobs Status to Slack 
11. Get Jenkins Credentials and App credentials from Hachicorp Vault

Have fun :) 