### running our application on k8s

Deploy redis

    kubectl create deployment redis --image=redis

Deploy 

    for SERVICE in hasher rng webui worker; do
      kubectl create deployment $SERVICE --image=$REGISTRY/$SERVICE:$TAG
    done

### Scaling a deployment

    k get deploy
    k scale deploy/redis --replicas=10

## Daemon sets

We want to scale redis in a way that is different from how we scaled worker

We want one (and exactly one) instance of redis per node

What if we just scale up deploy/redis to the number of nodes?

nothing guarantees that the redis containers will be distributed evenly

if we add nodes later, they will not automatically run a copy of redis

if we remove (or reboot) a node, one redis container will restart elsewhere

Instead of a deployment, we will use a daemonset.

### Daemon sets in practice

Daemon sets are great for cluster-wide, per-node processes:

- kube-proxy

- weave (our overlay network)

- monitoring agents

- hardware management tools (e.g. SCSI/FC HBA agents) etc.