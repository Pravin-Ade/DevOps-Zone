terraform {
    backend "s3" {
        bucket = "bucket_name"
        key = "global/s3/terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "terrform_lock"
        encrypt = true
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

