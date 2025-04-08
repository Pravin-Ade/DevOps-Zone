## Docker playgrounds
https://killercoda.com/login

https://labs.play-with-docker.com/


## What is Docker?
Installing Docker" really means "Installing the Docker Engine and CLI.

The Docker Engine is a daemon (a service running in the background).

This daemon manages containers, the same way that a hypervisor manages VMs.

We interact with the Docker Engine by using the Docker CLI.

The Docker CLI and the Docker Engine communicate through an API.


## Our first Containers
### Hello World
    docker run busybox echo hello world

    busybox - is a smallest image we used here
    echo Hello World - single process

### A more useful container

Let's run a more exciting container:
    docker run -it ubuntu
    root@04c0bb0ade:/#

**-it is shorthand for -i -t.**

**-i tells Docker to connect us to the container's stdin.**

**-t tells Docker that we want a pseudo-terminal.**

### Do something in our container
Try to run figlet in our container.

    root@04c0bb0a6c07:/# figlet hello
    bash: figlet: command not found
Alright, we need to install it.



## Understanding the Docker Network Command
The Docker Network command is the main command that would allow you to create, manage, and configure your Docker Network. 

## Docker overlay networks under the hood

**Q. How does it work? let's look inside containers.**
- docker exec containe-Name or id ip addr show

- docker exec *containe-Name or id* ip -details link show dev eth0






