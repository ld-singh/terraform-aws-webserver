variable "aws_region" {
  description = "AWS Region to launch servers"
  default     = "ap-southeast-2"
}

variable "aws_access_key" {
  description = "AWS User Access Key"
  default     = "XXXXXXXXXXXXXXXXXX"
}

variable "aws_secret_key" {
  description = "AWS User Secret Key"
  default     = "XXXXXXXXXXXXXXXXXX"
}

variable "aws_amis" {
  default = {
    ap-southeast-2 = "ami-0df609f69029c9bdb"
  }
}

variable "instance_type" {
  description = "Type of AWS EC2 instance."
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "Enter the path to the SSH Public Key to add to AWS."
  default     = "~/.ssh/yourkey.pem"
}

variable "key_name" {
  description = "AWS key name"
  default     = "name of keypair"
}

variable "instance_count" {
  default = 1
}
