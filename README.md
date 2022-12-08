# Document for terraform-aws-webserver

#### Table of Contents
1. [Install Pre-requisites](#install-pre-requisites)
2. [Usage](#usage)
3. [Requirements](#requirements)
4. [Providers](#Providers)
5. [Inputs](#inputs)
6. [Outputs](#outputs)

## Install Pre-requisites

<!-- markdownlint-disable no-inline-html -->
* [`terraform`](https://www.terraform.io/downloads.html) Required to run terraform commands
* [`pre-commit`](https://pre-commit.com/#install) Required to run pre-commit
* [`go`](https://go.dev/doc/install) Required for terraform docs hook
* [`terraform-docs`](https://github.com/terraform-docs/terraform-docs) required for terraform docs hook.
* [`TFLint`](https://github.com/terraform-linters/tflint) required for terraform tflint hook.

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.45.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.3 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_instance.webserver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.webserverkey](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.allow_ports](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [local_file.myterrakey](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.oskey](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | AWS User Access Key | `string` | `"XXXXXXXXXXXXXXXXXX"` | no |
| <a name="input_aws_amis"></a> [aws\_amis](#input\_aws\_amis) | n/a | `map` | <pre>{<br>  "ap-southeast-2": "ami-0df609f69029c9bdb"<br>}</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region to launch servers | `string` | `"ap-southeast-2"` | no |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | AWS User Secret Key | `string` | `"XXXXXXXXXXXXXXXXXX"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | n/a | `number` | `1` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Type of AWS EC2 instance. | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | AWS key name | `string` | `"name of keypair"` | no |
| <a name="input_public_key_path"></a> [public\_key\_path](#input\_public\_key\_path) | Enter the path to the SSH Public Key to add to AWS. | `string` | `"~/.ssh/yourkey.pem"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_addresses"></a> [ip\_addresses](#output\_ip\_addresses) | n/a |
| <a name="output_keyvalue"></a> [keyvalue](#output\_keyvalue) | n/a |
| <a name="output_webserver_ids"></a> [webserver\_ids](#output\_webserver\_ids) | n/a |
<!-- END_TF_DOCS -->
