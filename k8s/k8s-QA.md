### Q 1. Explain K8s Architecture?

1. Kubernetes is an open-source container orchestration platform used to manage and scale containerised application across clusters.
2. K8s follows a **Master (Control Plane)** and **Worker** Architecture, where the Master node that controll the cluster and worker nodes that run the aplication workloads.
3. **API-Server**: The heart of control plane, which act as main entry point and handle all communication within cluster.
4. **Kube-scheduler**: Which decides on which node a new pod should run on. in a simplest way, scheduler is watcher and schedule a pod on available node.
5. **Control manager**: Runs background controllers. like Node controller, Replication Controller, Deployment Controller, etc.
7. **Kubelet**: which is worker node side object, which is responsible for communicating with control plane and ensuring that the specified containers are running in pods. There is also the container runtime, such as containerd, CRI-O, which actually runs the containers.
8. **Kube-Proxy**: The kube-proxy manages network rules and handles routing traffic to the correct pods.

### Q 2. What happens when you run `kubectl apply/create -f deployment.yaml`?

1. The kubectl CLI sends the deployment manifest to the *kube-apiserver* via a REST API call.
2.  The *KUBE-APISERVER*  validate the request and stores the desired state in *ETCD*.
3.  The *KUBE-CONTROLLER-MANAGER* Specifically in our case, The Deployment controller detect that a new Deployment is needed. It creates a ReplicaSet and desired number of PODs.
4.  The *KUBE-SCHEDULER* then schedule each pod to a suitable node based on available resources and constraints.
5.  On the selected node, the kubelet instructs the container runtime (containerd, CRI-O) to pull the image and run the container.
6.  if a **Service** is defined, the **kube-proxy** set-up the networking rules so that traffic can reach these pods.

### Q 3. Why do we need a scheduler?

The scheduler is only responsible for deciding which pod goes on which node. It doesn't actually place the pod on the nodes. That's the job of the kubelet. The kubelet on the node, is who create the pod on the nodes. The schedule only decides which pod goes where.

When there are many Nodes and many containers/pods, you wanna make sure that the right pod ends up on the right node.

For **example**, there could be different sizes of nodes and pods. You wanna make sure the node has sufficient capacity to accommodate those containers/pods.

In Kubernetes, the scheduler decides which nodes the pods are placed on depending on certain criteria.

Lets take an example:

![alt text](pngs/schedule1.png)


You may have pods with different resources requirement. you can have nodes in cluster with dedicated to certain application 

For **example**, let's take one of these pods, the big blue one. It has a set of CPU and memory requirements.
The scheduler goes through two phases to identify the best node for the pod.

In the first phase, the scheduler tries to filter out the nodes that do not fit the profile for this pod.

For **example**, the nodes that do not have sufficient CPU and memory resources requested by the pod. So the first two small nodes are filtered out. So we are now left with the two nodes on which the pod can be placed. Now how does the scheduler pick one from the two? The scheduler ranks the nodes to identify the best fit for the pod. It uses a priority function to assign a score to the nodes on a scale of zero to 10.

For **example**, the scheduler calculates the amount of resources that would be free on the nodes after placing the pod on them. In this case, the one on the right would have six CPUs free if the pod was placed on it, which is four more than the other one. So it gets a better rank, and so it wins.

So that's how a scheduler works at a high level.


### Q 4. How does k8s achieve self-healing through its control loop?

for example, If a Pod craches or a Node fails, the kubelet detect the issue, and controller manager notices the mismatch between desired state and actual state.

