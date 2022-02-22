
### Docker
docker build -t python-flask-docker .
docker run --name python-flask-docker   -d -p 8080:8080 python-flask-docker  
curl http://localhost:8080

### Helm Chart
