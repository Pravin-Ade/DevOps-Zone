# null_resource with local-provisioner

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ec2_example" {
  ami = "ami-0d0ad8bb301edb745"
  instance_type = "t2.micro"
  tags = {
    name = "tf-instance"
  }
}

# resource "null_resource" "null_resource_simple" {
#     provisioner "local-exec" {
#         command = "echo Hello Terraform"
#     }
# }

resource "null_resource" "null_resource_simple" {
  
  triggers = {
    id = aws_instance.ec2_example.id
  }
  provisioner "local-exec" {
    command = <<EOT
      echo "Instance ID: ${aws_instance.ec2_example.id}" >> instance_info.txt
      echo "Public IP: ${aws_instance.ec2_example.public_ip} >> instance_info.txt
      echo "Date: $(date)" >> instance_info.txt
      echo "All Information written to instance_info.txt"
      EOT
  }
}


# null_resource with remote-provisioner