packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}
#create source for which image has to be built
source "amazon-ebs" "packprac" {
  ami_name      = "learn-packer-linux-aws-pract2"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}
#paina source nundi create a image
build {
  name    = "learn-packer"
  sources = [
    "source.amazon-ebs.packprac" 
  ]
}
