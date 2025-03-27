## A Step-by-Step Guide to Creating Users in Kubernetes

Creating users in Kubernetes is typically done via Kubernetes RBAC system, which helps you manage access to cluster resources. However, Kubernetes itself doesn't have a built-in user management system. Instead, users are typically managed outside Kubernetes (e.g., via an identity provider like Active Directory or using tools like kubectl or kubeconfig files).

1. Authentication with TLS Certificates:
When you set up a Kubernetes cluster (e.g., using kubeadm), authentication is handled through TLS certificates. Any user with a valid certificate signed by the cluster’s certificate authority (CA) is considered authenticated. The username is derived from the certificate’s Common Name (CN) field (e.g., “/CN=bob”).

2. Role-Based Access Control (RBAC):
Once authenticated, Kubernetes uses RBAC (Role-Based Access Control) to determine whether the user is allowed to perform certain actions on resources in the cluster.

3. Using kubectl for Access:
kubectl is the command-line tool used to interact with Kubernetes. It uses these TLS certificates to authenticate with the API server. The connection details, including certificates, are stored in a kubeconfig file.

4. Kubeconfig File:
When you set up Kubernetes with kubeadm, a kubeconfig file is automatically created. This file typically provides full admin rights (i.e., the cluster-admin RBAC role). It’s crucial not to share this file with your team unless necessary, as it can give them complete control over the cluster.

5. Usernames and Best Practices:
By default, the username in the auto-generated kubeconfig and certificate is ‘admin’. However, it’s better to use unique usernames that match your organization’s naming conventions. This will make it easier if you need to integrate with external authentication services later.


### Create a User Account

openssl req -new -newkey rsa:4096 -nodes -keyout pravin.key -out pravin.csr -subj "/CN=pravin/O=Infosys"

Now we have pravin.csr, we need to have it signed by the cluster CA. for that we create CertificateSigningRequest object.


`cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: pravin
spec:
  request: $(cat pravin.csr | base -w 0)
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 86400  # one day
  usages:
  - client auth
EOF`

Once the CSR has been created, it enters a Pending' condition

kubectl get csr

Now, we want to approve CSR object.

kubectl certificate approve pravin.

Now if we check the CSR again we see that it is in a Approved, Issued state.

kubectl get csr

To retrieve the certificate, we can run the following command

kubectl get csr pravin -o jsonpath='{.status.certificate}' | base64 --decode > pravin-access.crt

or

openssl x509 -req -in pravin.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out pravin-access.crt

Let's verify that we have a certificate for pravin

cat pravin-access.crt

Next requiremnt is pravin kubeconfig file is the clustr CA certificate. To retrieve it, use folowing command.

kubectl config view -o jsonpath='{.clusters[0].cluster.certificate-authority-data}' --raw | base64 --decode - > k8s-ca.crt

Now, we can start creating pravin's kubeconfig file.

2. Configure Your Kubernetes Cluster
Let's set up the cluster configuration in pravin's kubeconfig file. pull these details from our existing kubeconfig using the command below.

kubectl config set-cluster $(kubectl config view -o jsonpath='{.clusters[0].name}') --server=$(kubectl config view -o jsonpath='{.clusters[0].cluster.server}') --certificate-authority=k8s-ca.crt --kubeconfig=pravin-config --embed-cert

look at the contents of the pravin-config, we see that the cluster configuration has been set.

cat pravin-config

We can see that the userand context list are empty. Let's set up the user next which will import pravin's key and cert into the file.

kubectl config set-credentials pravin --client-certificate=pravin-access.crt --client-key=pravin.key --embed-certs --kubeconfig=pravin-config

Final kubeconfig requirement is to create a context.

kubectl config set-context pravin --cluster=$(kubectl config view -o jsonpath='{.clusters[0].name}') --namespace=infosys --user=pravin --kubeconfig=pravin-config

Finally, we will want to specify the context that pravin will use for his kubectl commands.

kubectl config use-context pravin --kubeconfig=pravin-config


Now, Let's test the pravin's kubeconfig by running the 'kubectl version' command.

kubectl version --kubeconfig=pravin-config

Now lets's go and list the running pods using pravin's kubeconfig

kubectl get pods --kubeconfig=pravin-config
