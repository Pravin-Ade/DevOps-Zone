## Docker networking

### The Container Network Mode

    docker network ls

Let's create a network called my-net-01

    docker network create my-net-01

    docker network create  --subnet=172.19.0.0/16 --gateway=172.19.0.1 --driver=bridge my-net-01

Placing containers on a new network

Create a new container named c0 and c1 and connect it to the network my-net-01

Start both container: c0 and c1 in my case

    docker  run -dit --name c0 --net my-net-01 alpine sh

    docker  run -dit --name c1 --net my-net-01 alpine sh

Install iputilsn for ping inside the containers

alpine doesent come with ping by default, install on both container.

    docker exec c0 apk add iputils

    docker exec c1 apk add iputils

Ping one container from the other

    docker exec c0 ping -c 4 c1

Clean up

    docker rm -f c1 c2


Note: for image ubuntu: docker exec c0 apt update and docker exec c0 apt install -y iputils-ping





