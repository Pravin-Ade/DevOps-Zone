## To pull a private image in a Kubernetes (k8s) resource (like a Pod, Deployment, Job, etc.)

1. Create an image pull secret that contains credentials for the private container registry.
2. Reference the image pull secret in your Kubernetes resource.
3. Use the private image in the containers.image field.

```
kubectl create secret docker-registry regcred \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=demo \
  --docker-password=DemoXXXXXXX \
  --docker-email=demo.xxxx@gmail.com
  —namespace=sec-pod
``` 

### secrete-deploy.yml
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: private-image-deployment
  namespace: sec-po
spec:
  replicas: 1
  selector:
    matchLabels:
      app: private-app
  template:
    metadata:
      labels:
        app: private-app
    spec:
      containers:
        - name: private-container
          image: sewalal/test-loger:01
      imagePullSecrets:
        - name: regcred
```

## Optional: Patch Default ServiceAccount in Namespace

If you want all Pods in my-namespace to automatically use the secret:

```
kubectl patch serviceaccount default \
  -n my-namespace \
  -p '{"imagePullSecrets": [{"name": "my-registry-secret"}]}'
```

__1. List pods in a namespace:__ _kubectl get po -n namespace or kubectl -n namespace get po_ \
__2. Check Pod Details:__ _kubectl describe po pod-Name -n namespace_ \
__3. View Pod Logs:__ _kubectl logs pod-name -n namespace_ \
__4. If the pod has multiple containers:__ _kubectl logs pod-name -c container-name -n namespace \
__5. Exec Into a Pod (Shell Access):__ _kubectl exec -it pod-name -n namespace -- /bin/bash_ \
