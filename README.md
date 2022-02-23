


Test App and DockerCompose and Nexus
### Docker
docker build -t python-flask-docker .
docker run --name python-flask-docker   -d -p 8080:8080 python-flask-docker  
curl http://localhost:8080

steps 

clone(first install git)



improvement plan: 
1. Ansible automate
2. Harbor and Helm Chart Repo
3. testing - e2e testing  
4. makefile  for easy management repo
5. sops encryption or get secrets from vault(for repo and k8s ingress )
6. Delete old images from nexus 
7. Use kaniko without need docker daemon
8. Security Integration
9. Run integration test sping up in docker compose or connect it inteeg-k8s cluster

