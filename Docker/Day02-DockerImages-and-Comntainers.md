## Docker Playgrounds
https://killercoda.com/login

https://labs.play-with-docker.com/


## What is Docker?
Installing Docker" really means "Installing the Docker Engine and CLI.

The Docker Engine is a daemon (a service running in the background).

This daemon manages containers, the same way that a hypervisor manages VMs.

We interact with the Docker Engine by using the Docker CLI.

The Docker CLI and the Docker Engine communicate through an API.

## Docker Components

When we install docker, we get two major components
- client: Docker commands are executed using the CLI.
- server/engine: The Docker daemon (dockerd) is in charge of creating and managing containers.

## Exploring Docker Commands

[Docker cheat sheet](https://dockerlabs.collabnix.com/docker/cheatsheet/)

Every container will have a unique id and name, if you donot set the name, docker engine will give random name

    docker run -d nginx

You will see that the container has set the name and id to the container.

    docker ps / docker ps -a

## Images and Tags
- Images can have tags, tags define image versions.
- docker images will have following naming pattern `<name>:<tag>`
- *name* represents the image name of your application and *tag* represents the version

In Docker hub we have 3 types of images namespace:

**Docker official images:**
Generally these images have `<name>:<tag>`

**Examples:**

- nginx
- busybox
- alpine
- openjdk

**Verified publisher images:/organization Images**
Generally these images have` <publisher>/<name>:<tag>`

**Examples:**

- jenkins/jenkins
- sewalal/clock - docker hub user is sewalal and the image name is clock

**Self Hosted Images:**

This namespace holds images which are not hosted on Docker Hub, but on third party registries.
Generally these images have `<username>/<name>:<tag>`

**For example:**
1. registry.example.com:5000/my-private/image
2. localhost:5000/my-private-registry

## How do you store and manage images?

Images can be stored:

- On your Docker host. - Private Registry 
- In a Docker registry Ex. Docker Hub, jFrog Artifactory, etc

## How to build an Images:

- To build a docker image first know the manual steps involved in bringing up your application.
- Once we have steps, then we have two approaches in building images
manual approach which involved creating a container & taking a snapshot (commit)
automatable & repetitive approach referred as Dockerfile approach.

### Manual approach with ubuntu

    docker image pull ubuntu:24.04

Now create a container with intractive mode

    docker container run -it --name custom-ubuntu ubuntu:24.04 /bin/bash

Now, update and install the java: run the commands

    apt update
    apt install openjdk-17-jdk -y

    ## Verify java version
    java --version

Now exit from container and execute commit command to create an image from existing container. Creates a new image (effectively a copy of the container).

The docker commit command will create a new layer with those changes, and a new image using this new layer.

    docker container commit custom-ubuntu jdk17:1.0

    custom-ubuntu - name of the existing container
    jdk17:1.0 - tag for the new image

## Tagging Images

    docker tag ImageID/name imageName
    docker commit ContainerID ImageName
    

## Our first Containers
### Hello World
    docker run busybox echo hello world

    busybox - is a smallest image we used here
    echo Hello World - single process

### A more useful container

Let's run a more exciting container: Now create a container and login into it
    docker run -it ubuntu /bin/bash
    root@04c0bb0ade:/#

-it is shorthand for -i -t.

-i --> tells Docker to connect us to the container's stdin.

-t --> tells Docker that we want a pseudo-terminal.

## Containerizing applications

#### Website in a container

*Steps:*

    mkdir website
    cd website
    wget https://www.free-css.com/assets/files/free-css-templates/download/page296/little-fashion.zip
    unzip little-fashion.zip
    mv 2127_little_fashion/ fashion/

*Webservers:*

1. apache: default directoey /usr/local/apache2/htdocs/
2. nginx: default directory /usr/share/nginx/html

Create a file called as Dockerfile

Now add the following

    FROM nginx:1.27
    COPY fashion/ /usr/share/nginx/html/fashion/

Build Docker image

    docker build -t myweb:1.0 .

Let's look at what images are on our host now.

    docker images

Let's build the container with this image

    docker container run -d --name myweb -P myweb:1.0
    
    docker container run -d --name myweb -p 80:80 myweb:1.

**Q. What all happened when we build the image?**

Sending the build context to Docker

- The build context is the “.” directory given to docker build.
- It is sent as an archive by the Docker client to the Docker daemon. 
- This allows to use a remote machine to build using local files.
- If that directory is big and your link is slow this part of the build will take sometime

Let us see what all changes was done on our final container:

Make a use of docker **history command**

The history command lists all the layers 
composing an image. For each layer, it shows its creation time, size, and creation command.

    docker history containerID or Name

### Exporting and Importing Docker Images

create new directory and change directory to that directory

    mkdir images
    docker images | grep myweb:1.0
    docker save -o grep myweb:1.0.img myweb:1.0 | save docker images to localy from docker cache
    ls -l 
    docker rmi myweb:1.0
    docker images | grep myweb:1.0
    docker load -i myweb:1.0.img


### Creating our image using Dockerfile

A Dockerfile is a build recipe for a Docker image. It contains a series of instructions telling Docker 
how an image is to be constructed.

The docker build command builds an image from a Dockerfile.

[Docker file reference!](https://docs.docker.com/reference/dockerfile/)

### Necessary instructions
[Docker metadata Reference](https://docs.docker.com/reference/dockerfile/#from)


FROM 

RUN     

ADD

COPY

CMD 

ENTRYPOINT

EXPOSE

ENV

WORKDIR

USER


