data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = var.pub_subnet1_id

    vpc_security_group_ids = [ aws_security_group.inbound_ssh_anywhere.id ]

    tags = {
      "type" = "public"
    }

    provisioner "local-exec" {
        command = "echo ${self.public_ip}"
    }
}

resource "aws_instance" "application" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = var.priv_subnet1_id

    vpc_security_group_ids = [ aws_security_group.inbound_ssh_vpc_3000.id ]

    tags = {
      "type" = "private"
    }
}