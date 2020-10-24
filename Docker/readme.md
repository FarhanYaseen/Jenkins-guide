
## Docker Commands Overview (Nice to know)
##### Running individual services
`docker-compose up rails graphql page-service front-end-dashboard front-end-widget-builder`

##### Stopping individual services
`docker-compose down rails graphql`

##### Running all services
`docker-compose up`

##### Stopping all services
`docker-compose down`

##### Prune everything
```
docker-compose down
docker system prune -a --volumes
```

##### Stopping individual services
`docker-compose down rails graphql`

##### List all the Running Containers
`docker ps`

##### List all the Containers
`docker ps -a`

##### List docker images
`docker images`

##### List all the docker images
`docker images -a`

##### Check logs of the container
`docker logs -f [container_name or container_id]`

##### Stop all running containers
`docker stop $(docker ps -aq)`

##### Remove all containers
`docker rm $(docker ps -aq)`

##### Remove all images
`docker rmi $(docker images -q)`

##### Remove dangling Images
`docker rmi -f $(docker images -f "dangling=true" -q)`

##### Show logs of single container
`
docker-compose logs -f (service_name)
` 
##### For example
`
docker-compose logs -f graphql
`