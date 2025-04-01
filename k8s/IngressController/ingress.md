## Ingress

An Ingress is a collection of rules that allow inbound connections to reach the cluster services. It can be 
configured to give services externally-reachable URLs, load balance traffic, terminate SSL, offer name 
based virtual hosting, and more.

Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster. Traffic 
routing is controlled by rules defined on the Ingress resource.
Whenever you want to expose your applications that reside in the k8s cluster, you configure an ingress 
resource that defines where the inbound traffic will be go.
Ingress is a powerful way to expose the services. There are many type of Ingress controllers like Load 
balancers from Cloud service providers, Nginx, Contour, Istio, Traefik and more.

![alt text](../ingress1.png)
