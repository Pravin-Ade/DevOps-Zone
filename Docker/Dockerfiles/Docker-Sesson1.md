## Building Docker Images with a Dockerfile

- Dockerfile is a build recipe for docker image.
- It contains a series of instructions telling Docker how an image is constructed
- The docker build command build an image from a dockerfile

**Create a Dockerfile**

you can use any text editor of your choice

    vim Dockerfile

    let's add to this Dockerfile

    FROM ubuntu
    RUN apt update && apt install apache2 -y

1. FROM - Base image for our build
2. RUN - will be executed by docker during the build

save our file and run 

    docker build -t myimge:1.0 .



