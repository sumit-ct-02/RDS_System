terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "backstage-interns-project"
    key    = "project/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [var.subnet_id-1, var.subnet_id-2]

  tags = {
    Name = "My RDS subnet group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = var.security_group
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = tonumber(ingress.value)
      to_port     = tonumber(ingress.value)
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_db_instance" "default" {
  identifier        = var.db_identifier
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  engine            = var.engine
  engine_version    = var.engine == "postgres" ? "11.22-rds.20240418" : "8.0.35" 
  instance_class    = var.instance_class
  username          = var.db_username
  password          = var.db_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot   = true

  tags = {
    Name = "MyRDSInstance"
    Owner = "backstage_interns_project"
  }
}
