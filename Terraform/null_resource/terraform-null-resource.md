## What is null resource?

As in the name suggest a prefix null which means this resource will not exist on your cloud Infrastructure.

The reason is there is no terraform state associate with it.

It does not have state which mean it will execute as soon as you run **terraform apply --auto-approve** command but no state will be saved. 

### Terraform _null_resource_ can be used in the following scenarios:

1. Run Shell commands
2. You can use it along with local provisioner and remote provisioner
3. It can also be used with terraform module, terraform count, terraform data source, local variables
4. It can even be used for output block

```
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

resource "null_resource" "null_resource_simple" {
    provisioner "local-exec" {
        command = "echo Hello Terraform"
    }
}

```

## Use case 1 - null_resource with local provisioner

_Run multiple commands_ - The **local-exec provisioner** is not limited to running single command but instead, you can run multiple commands within **local-exec provisioner** using the **null_resource**

local-exec provisioner gives you the liberty to execute shell command, so you can pretty much do everything possible with your terminal. Example you can create file.

see below example.

```
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
```

## Use case 2: null_resource with remote-provisioner
### What is remote-provisioner?

The remote-provisioner allows Terraform to run commands on a remote server like EC2 Instance over ssh.

__When to use this:__
1. Install software
2. Run Configuration script
3. fetch or move files on the instance
4. Execute remote setup logic after creation

_Exampe:_ Install Apache on an EC2 Instance using null_resource + remote-exec



