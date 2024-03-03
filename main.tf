terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  # profile = "https://d-9c677a0f05.awsapps.com/start#"
}

resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = local.key_pair
  vpc_security_group_ids = [data.aws_security_groups.selected.id]

  tags = {
    Name = "pavlo-kolinko-test5"
  }
}

