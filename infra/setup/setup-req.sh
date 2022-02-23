#!/usr/bin/env bash

# Update System and Install required based packages
sudo apt update 
sudo apt install apt-transport-https ca-certificates curl software-properties-common git vim curl wget telnet  -y 

# Install 
sudo apt-get install openjdk-8-jdk -y 
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y 

# Check Jenkins
systemctl status jenkins


# Get Jenkins Password
cat /var/lib/jenkins/secrets/initialAdminPassword 

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install docker-ce -y
sudo systemctl status docker

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Check Docker
docker info 
docker-compose --version


# Install MiniKube
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube

# Check Minikube
minikube version

# Install Kubectl 
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version -o yaml

# Install helm
snap install helm --classic 
helm version

# Add user to start miikube with Docker driver
useradd -s /bin/bash -d /home/docker -g docker -m -G sudo  docker 
su - docker

# Start minikube k8s cluster
minikube start --addons=ingress --cpus=2 --cni=flannel --install-addons=true --kubernetes-version=stable --memory=6g --apiserver-ips=172.17.0.4

# Check minikube status
minikube status
kubectl cluster-info
export KUBECONFIG=/home/docker/.kube/config 
kubectl get nodes


