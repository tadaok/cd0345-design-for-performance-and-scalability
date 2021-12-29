# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
  region     = "<replace by your region>"
  access_key = "<replace by your access_key>"
  secret_key = "<replace by your secret_key>"
  token = "<replace by your token>"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "Udacity_T2" {
  ami = "ami-0742b4e673072066f"
  count = 4
  instance_type = "t2.micro"
  subnet_id = "subnet-0ba07c2f2b1c3ea5c"
  tags = {
      name = "Udacity T2"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "Udacity_M4" {
  ami = "ami-0742b4e673072066f"
  count = 0
  instance_type = "m4.large"
  subnet_id = "subnet-0ba07c2f2b1c3ea5c"
  tags = {
      name = "Udacity M4"
  }
}