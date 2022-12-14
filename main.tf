#---------------------------------------------------------------------
# DEMO Terraform
#
# Build Web server with Nginx
#---------------------------------------------------------------------

#========================
# create AWS resources
#========================


# Create Security Group for use by Webserver

resource "aws_security_group" "allow_ports" {
  name        = "allow_ssh_http_webserver"
  description = "Allow inbound SSH traffic and http from any IP"
  vpc_id      = module.vpc.vpc_id

  #ssh access
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # Restrict ingress to necessary IPs/ports.
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    # Restrict ingress to necessary IPs/ports.
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http_webserver"
  }
}


#Create SSH Key to be used by EC2 instance

resource "tls_private_key" "oskey" {
  algorithm = "RSA"
}

resource "local_file" "myterrakey" {
  content  = tls_private_key.oskey.private_key_pem
  filename = "myterrakey.pem"
}

resource "aws_key_pair" "webserverkey" {
  key_name   = "myterrakey"
  public_key = tls_private_key.oskey.public_key_openssh
}


# Create Ec2 instance for webserver

resource "aws_instance" "webserver" {
  instance_type          = var.instance_type
  ami                    = lookup(var.aws_amis, var.aws_region)
  count                  = var.instance_count
  key_name               = aws_key_pair.webserverkey.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_ports.id}"]
  subnet_id              = element(module.vpc.public_subnets, count.index)
  user_data              = file("scripts/init.sh")

  tags = {
    Name = "Webserver"
  }
}



