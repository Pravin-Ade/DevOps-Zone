# A Step-by-Step Guide to Creating Users in Kubernetes

Creating users in Kubernetes is typically done via Kubernetes' **RBAC** (Role-Based Access Control) system, which helps manage access to cluster resources. However, Kubernetes itself doesn't have a built-in user management system. Instead, users are typically managed outside Kubernetes (e.g., via an identity provider like Active Directory or using tools like `kubectl` or `kubeconfig` files).

### 1. Authentication with TLS Certificates
When you set up a Kubernetes cluster (e.g., using `kubeadm`), authentication is handled through **TLS certificates**. Any user with a valid certificate signed by the cluster’s certificate authority (CA) is considered authenticated. The username is derived from the certificate’s **Common Name (CN)** field (e.g., “/CN=user”).

### 2. Role-Based Access Control (RBAC)
Once authenticated, Kubernetes uses **RBAC** to determine whether the user is allowed to perform certain actions on resources in the cluster.

### 3. Using `kubectl` for Access
`kubectl` is the command-line tool used to interact with Kubernetes. It uses these TLS certificates to authenticate with the API server. The connection details, including certificates, are stored in a **kubeconfig file**.

### 4. Kubeconfig File
When you set up Kubernetes with `kubeadm`, a **kubeconfig file** is automatically created. This file typically provides full admin rights (i.e., the **cluster-admin** RBAC role). It’s crucial not to share this file with your team unless necessary, as it can give them complete control over the cluster.

### 5. Usernames and Best Practices
By default, the username in the auto-generated kubeconfig and certificate is ‘admin’. However, it’s better to use unique usernames that match your organization’s naming conventions. This will make it easier if you need to integrate with external authentication services later.

---

## Create a User Account

To create a new user (e.g., "user"), follow these steps:

1. **Create a Certificate Signing Request (CSR)**

   Run the following command to generate a CSR for the user:

   ```bash
   openssl req -new -newkey rsa:4096 -nodes -keyout user.key -out user.csr -subj "/CN=user/O=organization"

Now that we have the `user.csr` file, we need to have it signed by the cluster's **Certificate Authority (CA)**. To do this, we create a **CertificateSigningRequest (CSR)** object in Kubernetes.

Run the following command to create the CSR object:

    cat <<EOF | kubectl apply -f -
    apiVersion: certificates.k8s.io/v1
    kind: CertificateSigningRequest
    metadata:
      name: user
    spec:
      request: $(cat user.csr | base64 -w 0)
      signerName: kubernetes.io/kube-apiserver-client
      expirationSeconds: 86400  # one day
      usages:
      - client auth
    EOF


Once the CSR has been created, it enters a Pending' condition

    kubectl get csr

Now, we want to approve CSR object.

    kubectl certificate approve user.

Now if we check the CSR again we see that it is in a Approved, Issued state.

    kubectl get csr

To retrieve the certificate, we can run the following command

    kubectl get csr user -o jsonpath='{.status.certificate}' | base64 --decode > user-access.crt

or

    openssl x509 -req -in user.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out user-access.crt

Let's verify that we have a certificate for user

    cat user-access.crt

Next requiremnt is user kubeconfig file is the clustr CA certificate. To retrieve it, use folowing command.

    kubectl config view -o jsonpath='{.clusters[0].cluster.certificate-authority-data}' --raw | base64 --decode - > k8s-ca.crt

Now, we can start creating users's kubeconfig file.

**2. Configure Your Kubernetes Cluster**

Let's set up the cluster configuration in user's kubeconfig file. pull these details from our existing kubeconfig using the command below.

    kubectl config set-cluster $(kubectl config view -o jsonpath='{.clusters[0].name}') --server=$(kubectl config view -o jsonpath='{.clusters[0].cluster.server}') --certificate-authority=k8s-ca.crt --kubeconfig=user-config --embed-cert

look at the contents of the user-config, we see that the cluster configuration has been set.

    cat user-config

We can see that the userand context list are empty. Let's set up the user next which will import user's key and cert into the file.

    kubectl config set-credentials user --client-certificate=user-access.crt --client-key=user.key --embed-certs --kubeconfig=user-config

Final kubeconfig requirement is to create a context.

    kubectl config set-context user --cluster=$(kubectl config view -o jsonpath='{.clusters[0].name}') --namespace=dev --user=user --kubeconfig=user-config

Finally, we will want to specify the context that user will use for his kubectl commands.

    kubectl config use-context user --kubeconfig=user-config


Now, Let's test the user's kubeconfig by running the 'kubectl version' command.

    kubectl version --kubeconfig=user-config

Now lets's go and list the running pods using user's kubeconfig

    kubectl get pods --kubeconfig=user-config

**3. Assign Roles Within a Namespace**

**scenario:** We need to give user a role that will give him complete freedom within the ‘dev’ namespace but nothing else outside of his namespace.

    kubectl create rolebinding user-admin --namespace=ns-user --clusterrole=admin --user=user
