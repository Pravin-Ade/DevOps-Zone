resource "aws_instance" "web" {
    ami = "ami-0d0ad8bb301edb745"
    instance_type = "t2.micro"
    tags = {
      name = "terraform EC2"
    }
  
}