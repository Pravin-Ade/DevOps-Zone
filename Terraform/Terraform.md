### Q 1. You and other developer are working on the same terraform project. How do you manage the terraform state file (terraform.tfstat) to ensure both can collaborate effectively and avoid confilict? or What Happens When Two Engineers Run terraform apply Simultaneously?

When two engineers run terraform apply at the same time on the same infrastructure, it can lead to race conditions, state file corruption, or unexpected infrastructure changes.

1. Use remote state store:
   
- terraform uses a state file (*terraform.tfstate*) to keep track of the current infrastructure.
- Both engineers' Terraform processes will read the same state file at the beginning.
- Local state (terrsform.tfstate) is not ideal for collaboration.
- What to do: configure a remote backend

  - AWS S3 
  - Terraform Cloud
  - Azure Blob Storage
  - Google Cloud Storage 

2. Enable state locking

- terraform uses a state locking mechanism to prevent simultaneous writes.
- Prevent simultaneous operations (like: terraform apply) that could corrupt the state.
- If you are using a remote backend like:
    - With AWS S3: use DynamoDB for state locking
    - Terraform cloud
    - Azure blov with state locking
    - google cloud storage wih locking
then only one engineer will acquire the lock, and the other will get an error like:

    - error acquiring the state lock
- The engineer who acquired the lock first will proceed with terraform apply.
- The second enginner will be blocked until the lock is releasd or will recieve an error.
- After the first apply completes, the state file is updated
- The second engineer must re-run terraform plan to get an updated plan based on the new state.

3. Use version control for code (Not for state)

- your .tf files should be in Git.
- Never commit terraform.tfstate or .terraform Directory

### Q 2. What If You're Not Using Remote State Locking?

- If you're using local state (e.g., terraform.tfstate on your machine), no locking occurs.
- Both engineers might apply changes at the same time, leading to:
    - State file corruption
    - Infrastructure drift
    - Unpredictable behavior

### Q 3. What Happens When the State File Is Deleted?

1. Terraform losses track of resources
    - Terraform no longer knows what resources exist or their current configuration.
    - It treats the infrastructure as if nothing has been created yet.
      
3. Running terraform plan shows all resources as new
    - Terraform will plan to create all resources again, even though they already exist in your cloud provider.
    - This can lead to duplicate resources, conflicts, or errors (e.g., "resource already exists").
      
5. Runing terraform apply can be dangerous

- If you apply without restoring the state, Terraform might:
    - Try to recreate resources.
    - Fail due to name conflicts.
    - Cause downtime or data loss.

### Q 4. How to Recover from a Deleted State File?

1. Restore from Backup
2. Use terraform import
3. Recreate the State File Manually





