## Docker commands

1.	Docker --help
2.	Docker --version
3.	Docker version --format ‘{{json .}}’
4.	Docker info
5.	Docker pull --help
6.	Docker pull ubuntu:20.04 (uses a specific ‘tag’)
7.	Docker pull redis (doesn’t use a ‘tag’, so the latest version is pulled by default)
### images commands

8.	Docker image ls
9.	Docker images
### container commands

10.	Docker run redis
11.	Docker ps
12.	Docker ps -a
13.	Docker run -it redis
14.	Docker run -d redis
15.	Docker run -it -d redis
16.	Docker run -it --name Pravin-redis -d redis
17.	Docker stats
### search commands
18.	Docker search redis
19.	Docker search --filter=stars=3 --no-trunc redis
20.	Docker search --filter=stars=3 --no-trunc --limit 10 redis
21.	Docker start a8217c4c56 (also try name instead of ID here)
22.	Docker stop a8217c4c56 (also try name instead of ID here)
23.	Docker restart a8217c4c56 (also try name instead of ID here)
24.	Docker pause a8217c4c56 (also try name instead of ID here)
25.	Docker unpause a8217c4c56 (also try name instead of ID here)
26.	Docker logs a8217c4c56 (also try name instead of ID here)
27.	Docker exec -it a8217c4c56 bash (start bash inside the container, type exit to exit the bash)
28.	Docker run -i -t --name Pravin-redis -d redis /bin/bash
29.	Docker exec 023828e786e0 apt-get update
30.	Docker rename vibrant_yellow test (renames the container to “test”, container can be running or stopped)
31.	Docker rm test (you have to stop the container before removing it, also try this with container ID)

32.	Docker stop $(docker ps -a -q) (Stops all running containers)


33.	Docker rm -f $(sudo docker ps -a -q) (removes all stopped containers)
34.	Docler rmi -f $(docker images -a -q) (removes all images)

35.	Docker inspect happy_faraday (also works with ID)
36.	Docker kill happy_faraday (same as stop)

### stop all running container
37.	Docker kill $(docker ps -q) (stops all running contaners)
38.	Docker system prune 


### To see dangling images in action
```
Cat > Dockerfile
FROM ubuntu:latest
CMD ["echo", "Hello World"]
```

Ctrl + D (close the file)

    docker build -t my-image . //builds image from Dockerfile
    docker images

//open up the editor in docker playground n make changes

```
FROM ubuntu:latest
CMD ["echo", "Hello World!"] (the exclamation is extra)
```

    docker build -t my-image . //same command with same image name
    docker images //now you will see dangling images

	docker image prune -a // specifically works for dangling images

39.	Docker attach <container_name> (opposite of -d, we will see this in action in the next step)
40.	To work with cp command - 
	Docker run -i -t --name=pravinredis -d redis /bin/bash
	
	Touch test_file (creates a test file in the current directory)

	Docker cp . pravinredis:/data (copies everything from current directory to pravinredis container)


Q. How to delete/remove images?

    docker rmi <id>/<name>

Q. How to remove multiple images?

    docker rmi -f $(docker images -a -q)

Q. How to remove conatiner images?

    docker rm <container-id>/<name> | Let's assume conatinerID: d7dd08f477e2 and name: alpine
    docker rm d7
    docker rm alpine

Q. How to remove multiple conatiner images?

    docker rm -f $(docker ps -a -q)

Q. How can I rename docker image? How to rename docker image without rebuilding it?

    docker tag OldName:tag NewName:tag
    docker tag oldDockerImage:1.0 NewDockerImg:1.2

Q. Another way to rename docker container

    docker rename OldName_app NewNameApp
    docker ps 


    