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

resource "aws_key_pair" "deployer" {
  key_name   = "bastion-and-app-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/HUaGp1kLVC20TExFSkMRDwMsuHiFQMLVAvbH6GQ5mxhs2brBEpm5lj9JaxE9aehAj2392ms52PheZJaDU2Lggl01QrREJY02jN0GHRkg3FZ+3bCC8SnDguNq+6H0gejRh8v2uDsIfJCsXpYlKPZXobd5ZX58TpyZ68rLv8JyGWoqqkFN+lbyzXqB1DIyDNw3HxeJ4tuD74nlbTBmUCrouMWqd8A663b6Y5VMyOlrzq1TM02RnvIb8QP/V7In1BiH4sc+zctpydg+yxK7ouapRiHePjX2szfn/Ep28H30DLXObc+BGIHlz3PU9Sb9EUrJA0NXbS8TiZ+JzocMc/cCsDlNqSqIR2Dq/bBa/8FCJBnNhvotrOgAWvvgpokF8ltM4i4mVKa37rs94zcfEX2o2oD4uv5d+TXL4FgIWoLx2g7axymZBeZewzb2B5kDno0xOqF29rZjZI/jOOlBXkDMqu83FJ0Se6PhX+AQK1XXlKKSLawj17IoFuwq8S892QbopQjVW68JiyrutTvMlN+Y425WYDt+8IwhTkAdAxRRolO20C8wyfqtIbnx9d8aZQGqn/F6eqQnh46LXbbyoveQ/npfgjgocq/gWzIjlOZH8GuG6OAmcsjqZfgeR7zBXLDAftPzd/IAvHDeBmXr09xaDstVE+T//jeXlbxRSfmLFw== ec2"
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

    key_name   = "bastion-and-app-key"
}

resource "aws_instance" "application" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = var.priv_subnet1_id

    vpc_security_group_ids = [ aws_security_group.inbound_ssh_vpc_3000.id ]

    tags = {
      "type" = "private"
    }

    key_name   = "bastion-and-app-key"
}