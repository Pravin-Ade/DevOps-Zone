resource "aws_s3_bucket" "terraform_state"{
    bucket = "bucket_name"
    acl = "private"
}