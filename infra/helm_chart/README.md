helm upgrade --install  flask  .  -f dev.yaml --kubeconfig /home/docker/.kube/config  -n default --set image.name=python-flask-docker,image.tag=v1.1.2