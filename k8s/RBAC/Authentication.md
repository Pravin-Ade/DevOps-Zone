## Authentication process

The authentication process in Kubernetes involves verifying the identity of users and service accounts before they can interact with the API server.

### Types of Users
**Normal Users:** These are typically human users. Kubernetes does not manage normal user accounts directly; instead, it relies on external systems like LDAP, OAuth, or client certificates

[Ref here for User creation in k8s](RBAC.md)

**Service Accounts:** Managed by Kubernetes, these are used by applications running within the cluster. Service accounts are tied to specific namespaces and have associated credentials stored as Secrets.

### Authentication Methods

1. Client Certificates
2. Bearer Token
3. Authentication Proxy
4. OpenID Connect (OIDC)

## Authentication Process Steps

**1.Request Initiation:** A user or service sends an API request to the Kubernetes API server.

**2. Authentication Plugins:** The API server uses configured authentication plugins to verify the request. These plugins check the provided credentials (e.g., certificates, tokens) against the configured authentication methods

**3.User Identity Extraction:** If authentication is successful, the plugin extracts the user identity (username, UID, groups) from the credentials.

**4. Authorization:** The API server then checks if the authenticated user has the necessary permissions to perform the requested operation using RBAC.

### Let's understand with example:

Imagine you run `kubectl get pods.`

- kubectl reads your kubeconfig file to get your credentials.
- It sends an API request to the server with your credentials.
- The API server authenticates your credentials using the configured plugins.
- If authenticated, the server checks if you have permission to list pods.
- If authorized, the server retrieves the pod information and sends it back to kubectl.

## What is an Admission Controller?

An admission controller is a piece of code that intercepts requests to the Kubernetes API server before they are persisted, but after they have been authenticated and authorized.

These controllers can validate, mutate, or reject requests based on predefined policies.

**Example Scenario:** Pod Security Policy

Imagine you want to enforce security policies on pods to ensure they don't run as privileged containers. You can use the PodSecurityPolicy admission controller for this purpose.

Create a PodSecurityPolicy:

```apiVersion: policy/v1beta1
kind: PodSecurityPolicy
metadata:
  name: restricted
spec:
  privileged: false
```

Create a Role and RoleBinding:

```apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: psp-role
rules:
- apiGroups: ["policy"]
  resources: ["podsecuritypolicies"]
  verbs: ["use"]
```

Role Binding

```apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: psp-rolebinding
subjects:
- kind: User
  name: your-username
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: psp-role
  apiGroup: rbac.authorization.k8s.io
```

Deploy a Pod

```apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-container
    image: nginx
    securityContext:
      privileged: true
```

### Admission Control Process

***Authentication:*** The API server authenticates the request.

**Authorization:** The API server checks if the user has permission to create the pod.

**Mutating Phase:** Any mutating admission controllers modify the request if necessary.

**Validating Phase:** The PodSecurityPolicy admission controller validates the pod's security settings. Since the pod is trying to run as a privileged container, which is disallowed by the policy, the request is rejected.