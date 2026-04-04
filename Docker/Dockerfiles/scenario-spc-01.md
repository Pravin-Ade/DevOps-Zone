### Image is created from the following Dockerfile. The container is not starting (exited state) Findout the reason?

    FROM eclipse-temurin:17 
    LABEL author="Pravin"
    USER pravin
    ADD https://referenceappslt.s3.ap-south-1.amazonaws.com/spring-petclinic-3.3.0-SNAPSHOT.jar /apps/spring-petclinic-3.3.0-SNAPSHOT.jar
    EXPOSE 8080
    /CMD Executes when the container is started
    CMD [ "java", "-jar", "/apps/spring-petclinic-3.3.0-SNAPSHOT.jar" ]

  ### Reason behind container goes into a exited state

 You're trying to download a JAR file into /apps/ using the ADD instruction, 
 but you're also switching to the pravin user before that. The pravin user typically does not have permission to write to most directories, 
 including /apps.

## Running the application as a non root user
create a user called as spc, and copy the jar file into user’s home directory

    FROM eclipse-temurin:17
    LABEL author="Pravin"
    RUN useradd -m -d /apps -s /bin/bash spc
    USER spc
    ADD --chown=spc:spc https://referenceappslt.s3.ap-south-1.amazonaws.com/spring-petclinic-3.3.0-SNAPSHOT.jar /apps/spring-petclinic-3.3.0-SNAPSHOT.jar
    WORKDIR /apps
    EXPOSE 8080
    # CMD Executes when the container is started
    CMD [ "java", "-jar", "spring-petclinic-3.3.0-SNAPSHOT.jar" ]

    docker exec <containerID> <command>
