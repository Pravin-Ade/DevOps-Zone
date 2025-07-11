## Terraform QA

**1. Explain the concept of Infrastructure as code (IaC).**

Infrastructure as code (IaC) is a practice of managing and provisioning infrastructure through code ranther than manual process.
Tools like Terraform, CloudFormation and Ansibleallow for automated and consistent provisioning of infrastructure, Improving scalability, and minimizing human error.

**2. How do you secure infrastructure when using Terraform?**

    - Use tools like checkov, terraform Sentinel for policy enforcement.
    - Implement least privilege in IAM roles.
    - Ensure encrypted storage (e.g. S3 Bucket, RDS Instances).
    - Regularly scan Terraform code for vulnerability.

**3. What is IaC vulnerability?**

An IaC vulnerability refers to secure risks introduced through misconfiguration, hard coded credentials, open ports or insecure IaC templates. these can include S3 buckets, excessive permissions in security
groups, or unencrypted resources.

**4. How do you secure IaC templates?**

    - Use IaC security scanning tools like Checkov, TFSec, or Terrascan
    - Implement policy as code to enforce security rules automatically.
    - Store secrets securely using tools like AWS Secrets Manager, terraform vault or Azure Key Vault.

**5. What are the key features of hashicorp vault?**

    - secure secret storage
    - Dynamic  secrets (e.g. AWS, database credentials)
    - Encryption as service
    - Auditing and monitoring of secret usage.

**6. What is a dynamic secret in hashicorp Vault, and why is it important?**

A dynamic secret is generated on-demand and is short lived. It minimizes the risk of credential exposure by providing credential that that are valid for a specific period, after which they expire automatically.

**7. **


