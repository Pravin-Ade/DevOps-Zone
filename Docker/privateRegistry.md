## How to set docker private registry?

    docker run -d -p 5000:5000 --restart=always --name registry registry:2.7

The -d flag will run the container in detached mode. The -p flag publishes port 5000 on your local machine’s network.

### Push and Pull an Image to the private registry

To push to or pull from our local registry, we need to add the registry’s location to the repository name. The format is as follows: `my.registry.address:port/repositoryname.`

Replace my.registry.address.port with localhost:5000 because our registry is running on our localhost and is listening on port 5000. 

    docker tag ubuntu localhost:5000/ubuntu:24.04
    docker push localhost:5000/ubuntu:24.04

    docker logs -f registry
    
    docker pull localhost:5000/ubuntu:24.04

#### verify local registry setup
    docker exec -it registry sh

inside registry run cd var/lib/registry you would see tehe docker folder.

### Q. How to list of images are present in the registry?

  curl -X GET http://registry.example.com:5000/v2/_catalog or curl -X GET localhost:5000/v2/_catlog

## Insecure Docker Registry

To configure Docker to use an insecure registry, follow these steps:

**Update Docker Daemon Configuration:** (/etc/docker/daemon.json)

    {
    "insecure-registries": ["localhost:5000"]
    }

**Restart Docker Daemon:**

    sudo systemctl daemon-reload
    sudo systemctl restart docker

**verify**

    docker info




