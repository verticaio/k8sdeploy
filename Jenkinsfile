pipeline {
    agent any

    environment {
        DOCKER_REPO = 'babakmammadov95'
        DOCKER_REGISTRY = 'docker.io'
        PROJECT_NAME = 'default'
        MS_NAME = 'python-flask-docker'
        DOCKER_REPO_USERNAME = credentials('docker_api_username')
        DOCKER_REPO_PASSWORD = credentials('docker_api_token')
        KUBE_CREDS = credentials('kube_config')
    }

    stages {
        stage('Check Env Branch Main') {
         when {
            expression { env.GIT_BRANCH =~  /(main)/ }
        }
            steps {
                script { DEPLOY_ENV = 'dev'}
                echo "${DEPLOY_ENV}"
            }
        }


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

        stage('K8s Deploy') {
            steps {
                echo 'Start deploy application k8s ....'
                sh "cd infra/helm_chart ; sudo helm upgrade --install  $MS_NAME  .  -f ${DEPLOY_ENV}.yaml --kubeconfig $KUBE_CREDS  -n $PROJECT_NAME --set image.name=$MS_NAME,image.tag=$BUILD_TIMESTAMP"
            }
        }      

        stage('Check Deployment&AutoRollback') {
            steps {
                echo 'Checking deploy application k8s ....'
                sh """
                sudo kubectl rollout status deployment $MS_NAME -n $PROJECT_NAME  --kubeconfig $KUBE_CREDS  
                export resCode=\$?
                if [ $resCode -eq 0 ]; then
                    echo "Application deployed succesfully ..."
                else 
                    echo "Problem encontered when when deploying"
                    sudo helm rollback $MS_NAME  0 --kubeconfig $KUBE_CREDS
                    echo "App rollback started..."
                fi
                exit $resCode
                """
            }
        }   

    }
}