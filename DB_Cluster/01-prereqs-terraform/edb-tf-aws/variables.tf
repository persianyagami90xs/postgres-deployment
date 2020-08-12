# Most frequently accessed settings
# Region
variable "aws_region" {
  default = "us-west-2"
}

# Instance Count
variable "instance_count" {
  default = 3
}

# Instance Type
variable "instance_type" {
  description = "The type of instances to create."
  # Enter AWS Instance type like t2.micro, t3.large, c4.2xlarge m5.2xlarge etc....
  # instance_type = "t2.micro"
  # instance_type = "t3.large"
  # instance_type = "c4.2xlarge"
  # instance_type = "m5.2xlarge"
  default = "t2.micro"
  type    = string
}

# VPC
variable "public_cidrblock" {
  description = "Public CIDR block"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc_cidr_block" {
  description = "CIDR Block for the VPC"
  default     = "10.0.0.0/16"
}

# Name of the Cluster
variable "cluster_name" {
  description = "The name to the cluster"
  default     = "Dev"
  type        = string
}

# IAM User Name
variable "user_name" {
  description = "Desired name for AWS IAM User"
  type        = string
  default     = "edb-iam-postgres"
}

# IAM Force Destroy
variable "user_force_destroy" {
  description = "Force destroying AWS IAM User and dependencies"
  type        = bool
  default     = true
}

# SSH
variable "ssh_keypair" {
  description = "The SSH key pair name"
  type        = string
  # Enter SSH key pair name.
  # Items to exclude: full path and file extension (.pem or .ppk)
  # Example: ssh_keypair = "<nameofkeypairfile>"
  default = "edb-postgres-cluster"
}

variable "ssh_key_path" {
  description = "SSH private key path from local machine"
  type        = string
  default     = "~/edb-postgres-cluster.pem"
}
