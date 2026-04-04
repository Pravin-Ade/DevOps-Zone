### Docker volume

Volumes are special directories in a container

Volumes can be declared in two different ways. 
Within a Dockerfile, with a VOLUME instruction.

    docker run --name -d -p 7000:80 nginx
    docker ps
    docker logs --tail 1 -f container-id

**Start a nginx container and save the access.log outside the container**
Start a nginx container with a local directory mounted as the log directory

    mkdir -p /var/tmp/nginx/logs

    docker run --name nginx-srv-1 -d -p 8000:80 -v /var/tmp/nginx/logs/:/var/log/nginx nginx

    cd /var/tmp/nginx/logs/

    cat access.log

    docker logs tail -f 1 container-id

access app on host 

    curl http://localhost:8000

access app inside container

    docker exec -it container-id /bin/sh

    curl http://localhost:80

Sharing Volumes (from host) to containers:

    mkdir -p /apps/website/nginx/html

    docker run --name nginx-srv-1 -d -p 7000:80 -v /apps/website/nginx/html:/usr/share/nginx/html nginx

    curl http://localhost:7000 

You will see, you are not able to see the nginx welcome page

Creat simple html file and reload to the websites

     echo 'Hello from host shared directory!!!' > /apps/website/nginx/html/index.html

## Sharing Volumes across containers

- Volumes can be shared across container
- You can start a container with exactly the same volumes as another one. 
- The new container will have the same volumes, in the same directories. 
- They will contain exactly the same thing, and remain in sync.
- Under the hood, they are actually the same directories on the host.
- This is done using the --volumes-from flag for docker run

Creating an Independent Volume

    docker volume create --name vol-01

let's attach to the container

    docker run --name volume-srv-01 -it --rm -v vol-01:/datavolume01 ubuntu

    df -h /datavolume01 - run within the container, what is the size of the mount point

    echo "This is in vol-01" > /datavolume01/dataVolume01_file.txt

### Inspecting independent volume

    docker volume inspecrt vol-01

        "CreatedAt": "2025-04-30T06:41:34Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/vol-01/_data",
        "Name": "vol-01",
        "Options": null,
        "Scope": "local"

**Note:** As seen, we can even look at the data on the host at the path listed as the Mountpoint. We should avoid 
altering it as it can cause data corruption if applications or containers are unaware of changes















