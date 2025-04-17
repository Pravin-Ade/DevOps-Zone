**Q. You and other developer are woring on the same terraform project. How do you manage the terraform state file (terraform.tfstat) to ensure both can collaborate effectively and avoid confilict?**

1. Use remote state store:

- Local state (terrsform.tfstate) is not ideal for collaboration.
- What to do: configure a remote backend

  - AWS S3 
  - Terraform Cloud
  - Azure Blob Storage
  - Google Cloud Storage 

2. Enable state locking

- Prevent simultaneous operations (like: terraform apply) that could corrupt the state.
- How?
    - With AWS S3: use DynamoDB for state locking

3. Use version control for code (Not for state)

- your .tf files should be in Git.
- Never commit terraform.tfstate or .terraform Directory


