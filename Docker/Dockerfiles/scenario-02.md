## ENV - This instruction set environment variable
    FROM alpine
    ENV APP_DATA=/apps
    CMD ["sleep","1d"]

build an image called as env:test

    docker build -t env:test .

Create container

    docker run env:test 
Print environmental variables printenv

    docker exec <containerID> <cmd>
    docker exec 66 printenv
Now lets create a new container test2 with a different APPS_DIR value

    docker run -d --name env-test -e "APPS_DIR=/var/lib/apps" env:test

### Note:

Generally most of the configuration values (Database details, Backend service names or ips)
to the applications running in containers is passed as Environmetal variable


### Lets build a docker image for spring petclinic

    FROM eclipse-temurin:17
    LABEL project="learning" 
    LABEL author="Pravin"
    ARG USERNAME=spc
    RUN useradd -m -d /apps -s /bin/bash ${USERNAME}
    USER ${USERNAME}
    COPY --chown=${USERNAME}:${USERNAME}  target/spring-petclinic-3.4.0-SNAPSHOT.jar /apps/spring-petclinic-3.4.0-SNAPSHOT.jar
    WORKDIR /apps
    EXPOSE 8080
    # CMD Executes when the container is started
    CMD [ "java", "-jar", "spring-petclinic-3.4.0-SNAPSHOT.jar" ]

- Creating a custom user (spc) with home directory /apps
- Copying the JAR file with correct ownership
- Setting the working directory to /apps
- Running the JAR with a relative path (in /apps)

If we want to build the java package and docker image as part of docker image we use Multi staged docker files.

    FROM maven:3.9-eclipse-temurin-17 AS build
    COPY . /spc
    WORKDIR /spc
    RUN mvn package


    FROM eclipse-temurin:17-alpine
    LABEL project="learning" 
    LABEL author="Pravin"
    ARG USERNAME=spc
    RUN adduser -D -h /apps -s /bin/sh ${USERNAME}
    USER ${USERNAME}
    COPY --from=build  --chown=${USERNAME}:${USERNAME}  /spc/target/spring-petclinic-3.4.0-SNAPSHOT.jar /apps/spring-petclinic-3.4.0-SNAPSHOT.jar
    WORKDIR /apps
    EXPOSE 8080
    # CMD Executes when the container is started
    CMD [ "java", "-jar", "spring-petclinic-3.4.0-SNAPSHOT.jar" ]
    
    
