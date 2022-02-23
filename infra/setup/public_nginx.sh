#!/usr/bin/env bash


# Install Nginx
apt-get install nginx -y 
nginx -v 
systemctl status nginx

service_nodeport_url=$(runuser -l  docker -c 'minikube service python-flask-docker   --url')

cat <<EOT >/etc/nginx/conf.d/default.conf
server {
    listen       8081;
    server_name  _;

    location / {
        proxy_pass $service_nodeport_url;
    }
}
EOT

# Check Nginx config
nginx -t 

resCode=$?
if [ $resCode -eq 0 ]; then
    systemctl restart nginx
else 
    echo "Problem encontered when check nginx config"
fi
exit $retVal


