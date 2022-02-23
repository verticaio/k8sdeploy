pipeline {
    agent any

    environment {
        DOCKER_REPO = 'babakmammadov95'
        DOCKER_REGISTRY = 'docker.io'
        PROJECT_NAME='default'
        MS_NAME = 'python-flask-docker'
        DOCKER_REPO_USERNAME = credentials('docker_api_username')
        DOCKER_REPO_PASSWORD = credentials('docker_api_token')
        KUBE_CREDS = credentials('kube_config')
    }

    stages {
        stage('Docker Login1') {
            steps {
                echo 'Login to nexus repo...'
                sh 'ls -la; id'
            }} 


        stage('Docker login') {
			steps {
				   sh 'sudo docker login -u $DOCKER_REPO_USERNAME -p $DOCKER_REPO_PASSWORD $DOCKER_REGISTRY'
				}
              }

        stage('Docker Build') {
            steps {
                echo 'Start building docker container...'
                sh 'sudo docker build --rm -t $DOCKER_REPO/$MS_NAME:$BUILD_TIMESTAMP .'
            }
        }

        stage('Docker push') {
            steps {
                echo 'Start pushing docker'
                sh 'sudo docker push $DOCKER_REPO/$MS_NAME:$BUILD_TIMESTAMP'
                sh 'sudo docker rmi $DOCKER_REPO/$MS_NAME:$BUILD_TIMESTAMP'

            }
        }            

    }
}