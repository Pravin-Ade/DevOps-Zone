# Old Way: Using DynamoDB for Locking
  # Store the state in an S3 bucket.
  # Create a DynamoDB table with a LockID key.
  # Reference the table in your backend config.

terraform {
    backend "s3" {
        bucket = "bucket_name"
        key = "global/s3/terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "terrform_lock"
        encrypt = true
    }
}

# New Way: Native S3 Locking (Terraform ≥ 1.10)

terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true # you can enable locking directly in S3 using the use_lockfile = true parameter.
  }
}


### terraform init

# you will see: .terraform/ directory and terraform.lock.hcl 
### terraform plan
### terrafom fmt
### terraform validate
### terraform apply


terraform {
    backend "s3" {
        bucket = "terraform-statelock01"
        key = "global/s3/terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "tf-lock"
        encrypt = true
    }
}

