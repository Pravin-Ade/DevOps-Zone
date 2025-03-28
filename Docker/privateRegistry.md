### How to set docker private registry?

    docker run -d -p 5000:5000 --name registry registry:2.7

The -d flag will run the container in detached mode. The -p flag publishes port 5000 on your local machine’s network.

To push to or pull from our local registry, we need to add the registry’s location to the repository name. The format is as follows: `my.registry.address:port/repositoryname.`

Replace my.registry.address.port with localhost:5000 because our registry is running on our localhost and is listening on port 5000. 

    docker tag ubuntu localhost:5000/ubuntu:24.04
    docker push localhost:5000/ubuntu

    docker logs -f registry