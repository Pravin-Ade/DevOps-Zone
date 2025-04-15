### DevOps/SRE Engineers Interview QA:
    
    0. connectivity issue in Linux.
    1. How to management console of physical servers and virtual servers.
    2. server downtime alert how can we start troubleshooting the situation.
    3. how to telnet and traceroute the ip and ssh port
    4. How to generate ssh key.
    5. Linux server patching, and pre checks and post checks
    6. Difference b/w  rhel 6 vs rhel 7 vs rhel 8
    7. how to extend lvm partitions.
    8. how to reduce lvm partitions.
    9. is it possible to reduce xfs FS. what is work around.
    10. how to scan if disk not detected.
    11. how to create new partition. fstab entries.
    12. Disk space variation  df output and real usage(df output) .
    13. bashing scripting basics and troubleshooting or debug
    14. how to set utimits and configuration files.
    15. how to install new packages and roleback.
    16. how clean linux cache memory.
    17. user administration.
    18. how to add duplicate users. user management db fiels and explanation.
    19. VMware snapshoot vs clone
    20. monitoring tools top, ps, mpstat, sar common question
    21. how to troubleshoot nfs share is not responding.
    22. performance tuning disk, cpu and memory
    23. Linux server trouble shooting kernel panic, grub rebuild, root passwd reset.
    24. how you can clear cache in linux server?
    25. I want to find name pravin and his contact number in a file without opening it?How can we find?

### Application	Training links	Topics
        
Linux Admin	https://www.tutorialspoint.com/linux_admin/index.htm

  Basic Linux Commands:

    File / Folder Management
    User/Group Management
    Systemd Services Start and Stop
    Resource Mgmt with systemctl
    Process Management
    Package Management
    Log Management
        
  Git/Github:	"https://www.tutorialspoint.com/git/index.htm
https://www.youtube.com/watch?v=xuB1Id2Wxak
https://www.katacoda.com/courses/git
https://docs.microsoft.com/en-us/learn/paths/github-administration-products/"	Basic Concepts
        Git - Life Cycle
        Different Operation(Create/Clone/ commit/push/pull/rename/delete)
        Managing Branches
        Handling Conflicts

https://www.tutorialspoint.com/docker/index.htm
https://docs.docker.com"	Overview
        Installing Docker and  services
        Architecture
        Working with Images and Containers
        Dokcer files and registries
        Storage and networking

	Introduction to Kubernetes
        Kubernetes Architecture and Basic Components
        different objects(namespaces/pods/ Labels and Selectors/ReplicaSet)
        Deployment,DaemonSet,Secrets

	Introduction to Ansible
        Ansible Inventory
        Introduction to YAML
        Playbooks
        Usage of Modules
        Facts, Roles, Tags
        
**Redhat playgrounds:**

https://lab.redhat.com/helpful-commands	

http://killercoda.com/		
        
https://www.tutorialspoint.com/execute_bash_online.php		
        	
        
### Interview Questions:

**Git	:**

https://www.interviewbit.com/git-interview-questions/

https://www.edureka.co/blog/interview-questions/git-interview-questions/

https://www.simplilearn.com/tutorials/git-tutorial/git-interview-questions	
        
        
**docker:**	https://www.edureka.co/blog/interview-questions/docker-interview-questions/	
        
**Kubernetes:**	https://www.edureka.co/blog/interview-questions/kubernetes-interview-questions/	
        
**Ansible**	

https://www.interviewbit.com/ansible-interview-questions/	

https://www.edureka.co/blog/interview-questions/ansible-interview-questions/	


### Docker and k8s QA:

Docker Questions	
    
1. What is Docker?	docker is a containerization tool that create containers. A container is just like vm
2. What are the advantages of using Docker container?	ship code faster, standarize application operations, seamless move code, save money by improving resource utilization.
3. What are the important features of Docker?	scalable(due to lightweight containers of docker), ability to reduce the size, increase productivity, Application Isolation, reduce infra and maintenance cost.
4. What are the main drawbacks of Docker?	
5. What is Docker image?	doker image is set of instruction to build a docker container. Docker image is a file use to execute code in docker container.
6. What is Docker Engine?	docker engine is an open source containerization technology, CLI uses a docker API to intract with daemon - dockerd
7. Explain Registries	we can store our images.
8. What command should you run to see all running container in Docker?	docker ps
9. Write the command to stop the docker container	docker kill containerName/Id/ docker stop containername/ID
10. What is the command to run the image as a container?	docker run -itd --rm -p 3000:80 --name container1 alpine
11. What are the common instruction in Dockerfile?	FROM, WORKDIR,RUN,COPY,ADD, CMD,EXPOSE,LABEL,
12. What is memory-swap flag?	
13. Explain Docker Swarm?	
14. How can you monitor the docker in production environments?	
15. What the states of Docker container?	Running State, Paused, exited and restarting
16. What is Docker hub?	public registry
17. What is Virtualization?	
18. What is Hypervisor?	
19. Explain Docker object labels	
20. Write a Docker file to create and copy a directory and built it using python modules?	
21. Where the docker volumes are stored?	/var/lib/docker
22. List out some important advanced docker commands	
23. How does communication happen between Docker client and Docker Daemon?	
24. Explain Implementation method of Continuous Integration(CI) and Continues Development (CD) in Docker?	
25. What are the command to control Docker with Systemd?	
26. How to use JSON instead of YAML compose file?	done
27. What is the command you need to give to push the new image to Docker registry? - 
        docker login privateReg, docker tag img, docker:1.x.x, docker push privateReg/sewalal/myrepo:1.x
28. How to include code with copy/add or volumes?	
29. Explain the process of scaling your Docker containers	
30. What is the method for creating a Docker container?	base img, dependencies, docker file
31. What are the steps for the Docker container life cycle?	
32. How can you run multiple containers using a single service?	
33. What is CNM?	
34. Does Docker offer support for IPV6?	Docker Ipv6 is only supported on docker daemon running on linux host. Edit  /etc/docker/daemon.json, set the ipv6 to true.
35. Can you lose data when the container exits?	Not at all, any data ur app write on disk get preserved in its container until we explicitly delete the container.
36. What are a different kind of volume mount types available in Docker?	
37. How to configure the default logging driver under Docker?	
38. Explain Docker Trusted Registry?	
39. What are Docker Namespaces?	
40. What are the three components of Docker Architecture	
41. What is client?	
42. What is the purpose of Docker_Host?	
43. How do I run multiple copies of Compose file on the same host?	
    
    
    
### Kubernetes Questions	
    
1. What is a node in Kubernetes?	
2. what process runs on Kubernetes Master Node? 	
3. What is a pod in Kubernetes?	
4. What is a Namespace in Kubernetes? -- LimitRange, resourceQuota -- pod 10	
5. Name the initial namespaces from which Kubernetes starts?	
6. What is etcd?	
7. What are the different services within Kubernetes?	
8. What is ClusterIP?	
9. What is NodePort? 	
10. What is the LoadBalancer in Kubernetes? 	
11. What is a headless service?	
12. What is Kubectl?	
13. Give examples of recommended security measures for Kubernetes.	
14. What is Kube-proxy? 	
15. How can you get a static IP for a Kubernetes load balancer? 	
16. Adhoc commands to create deployment/pod/service,etc	

        example: kubectl create deployment blue --image=nginx --http-port:8080

17. How to connect two pods in different namespaces.
18. Admission control, authentication and authorization?
19. 

