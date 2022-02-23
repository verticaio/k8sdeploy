Image 

Info 

Technical steps
webhook done
Tech Stack 

improvement plan: 

Copy&Right

## Docker
docker build -t python-flask-docker .
docker run --name python-flask-docker   -d -p 8080:8080 python-flask-docker  
curl http://localhost:8080 , steps clone(first install git)



##  improvement plan: 
1. Ansible automate
2. Harbor and Helm Chart Repo
3. testing - e2e testing  
4. makefile  for easy management repo
5. sops encryption or get secrets from vault(for repo and k8s ingress )
6. Delete old images from nexus 
7. Use kaniko without need docker daemon
8. Security Integration
9. Run integration test sping up in docker compose or connect it inteeg-k8s cluster
10. multibranh pipeline in jenkins and shared libs with groovy
11. notify to slack 
12. Get Jenkins from Hachicorp Vault
13. clean ws jenkins fix scripts good readme 
