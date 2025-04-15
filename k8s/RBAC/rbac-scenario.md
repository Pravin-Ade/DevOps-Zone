### RBAC Scenarios
1. scenario
  Pravin can create, delete and watch the deployment and replicaset in dev namespace. Readonly permission on all other namespaces (Pravin can get pods on all other namespaces) and Readonly access over the cluster as well.

```
kubectl create clusterrolebinding pravin-view --clusterrole view --user pravin
```

1. binded to the pod-reader role
2. read only access on cluster

### Role:

```apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
   namespace: dev
   name: pravin-role
rules:
- apiGroups: ["", "extensions", "apps", “apps/v1”, “events.k8s.io/v1”]
  resources: ["deployments", "replicasets", “daemonsets”, "services", “events”]
  verbs: ["list", "get", "watch", "create", "update", "patch", "delete"]
```

**Bind a user to the newly created role**

```apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
   name: pravin-role-binding
   namespace: dev
subjects:
- kind: User
  name: pravin
  apiGroup: ""
roleRef:
  kind: Role
  name: pravin-role
  apiGroup: ""
```

Add pravin to ready only role as well so pravin can list the pod only in dev namespace

``` 
  kubectl create -f deploy.yaml -n dev
  kubectl get po -n dev
  kubectl get deploy -n dev
  kubectl delete deploy nginx-deployment -n dev
  
  kubectl get rs -n dev
  kubectl delete rs nginx-deployment-86dcfdf4c6 -n dev
  ```


### view permission on cluster scope

Kubectl create clusterrolebinding pravin-view --clusterrole view --user pravin

2. scenario: 

kubectl -n dev create role pod-reader --verb list,watch,get --resource pods -oyaml > pod-reader.yaml



3. scenario (k8s-admin)

kubectl create clusterrolebinding k8s-admin --clusterrole admin --user k8s-admin


4. scenario:

5. scenario


kubectl rollout restart deployment coredns --namespace kube-system - restart without downtime.

k -n kube-system logs coredns-xxxx-yyy | tail -5 | tail -2

/var/log/pods/kube-system_coredns-xxxx-yyy/coredns

kubectl get endpointslices.discovery.k8s.io

kubectl get svc -o yaml

kubectl get all -A -l k8s-app=kube-dns

kubectl -n kube-system describe cm coredns

There is a service running in the container - but it does not seem to hold any data, probably due to not being able to connect to the api:

coredns can't fetch data from the kubernetes api but i can't understand why,


kubectl describe deploy coredns -n kube-system

kubectl get events --namespace=kube-system


kubectl -n kube-system get deployment coredns -o yaml


## view permission in all other namespaces (used default clusterrole view)

k auth can-i update deployments --as pravin -n dev

k get ns - get all namespaces

k -n app create rolebinding pravin-view --clusterrole view --user pravin

k -n default create rolebinding pravin-view --clusterrole view --user pravin

k -n kube-node-lease create rolebinding pravin-view --clusterrole view --user pravin

k -n kube-public create rolebinding pravin-view --clusterrole view --user pravin

###  just list Secret names, no content

# NOT POSSIBLE: assigning "list" also allows user to read secret values
k -n applications create role list-secrets --verb list --resource secrets

k -n applications create rolebinding ------------

### 

# view in all namespaces but not kube-system
k auth can-i list pods --as smoke -n default # YES
k auth can-i list pods --as smoke -n applications # YES
k auth can-i list pods --as smoke -n kube-public # YES
k auth can-i list pods --as smoke -n kube-node-lease # YES
k auth can-i list pods --as smoke -n kube-system # NO



kubectl get po -n app

kubectl apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml -n dev

kubectl get deploy -n dev

kubectl get rs -n dev

kubectl get events -n dev


kubectl get ds -n dev

#### Note: Error from server (Forbidden): daemonsets.apps is forbidden: User "pravin" cannot list resource "daemonsets" in API group "apps" in the namespace "dev"


kubectl apply -f https://k8s.io/examples/controllers/daemonset.yaml --namespace=kube-system

Error from server (Forbidden): error when retrieving current configuration of:
Resource: "apps/v1, Resource=daemonsets", GroupVersionKind: "apps/v1, Kind=DaemonSet"
Name: "fluentd-elasticsearch", Namespace: "kube-system"
from server for: "https://k8s.io/examples/controllers/daemonset.yaml": daemonsets.apps "fluentd-elasticsearch" is forbidden: User "pravin" cannot get resource "daemonsets" in API group "apps" in the namespace "kube-system"


**2nd test: view permissions in all ns**

**Note:** After crate rolebinding and bind with cluster role view u can able to view pods and describe it as well.
 
  kubectl -n dev create rolebinding pravin-view --clusterrole view --user pravin

  kubectl get po -n dev

  kubectl describe po nginx-deployment-xxxxx-yyyyy -n dev

