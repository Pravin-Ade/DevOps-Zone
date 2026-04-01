## Q. ArgoCD deploy is failing "sync-ATS-image-to-ecr(0)". for the changes.
Issue: seems argo is not responding to fetch logs or deploy services.

Root Cause🥇 New version of CDP, seems new version dosn't work, rolled backed.

## Q 2. Same issue again as above (Q 1)
- Pod was assigned to the worker Node , no more space for ther pod.
Resolution: Terminate the pipeline and retry | cordon the broken node, so, pods will be reached to the other healthy nodes.

## Q 3. Insufficient resource issue, pods are in pending state waiting for nodes.


## Q 4. Single POD is having high CPU usage, what we you do?
- kill the pods.
