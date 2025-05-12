variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "vpc_id" {
  type        = string
  description = "VPC ID to launch instance in"
  default     = "vpc-0822634396310e8ea"
}
# subnet
variable "subnet_id-1" {
  type        = string
  description = "Subnet ID to launch instance in"
  default     = "subnet-0376b05408a1be5d4"
}

variable "subnet_id-2" {
  type        = string
  description = "Subnet ID to launch instance in"
  default     = "subnet-0cca197d7ebb7f99a"
}

variable "security_group" {
  type        = string
  description = "Security group name"
  default = ""
}
variable "allowed_ports" {
  type        = list(number)
  description = "List of allowed inbound ports"
  default = []
}


variable "db_identifier" {
  description = "The name of the DB instance."
  type        = string
}

variable "allocated_storage" {
  description = "The amount of storage (in GB) to allocate to the database instance."
  type        = number
  default     = 10
}

variable "storage_type" {
  description = "The storage type for the DB instance."
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "The database engine to use for the DB instance."
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine."
  type        = string
  default     = "15.2"
}

variable "instance_class" {
  description = "The instance class for the DB instance."
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "The username for the database."
  type        = string
}

variable "db_password" {
  description = "The password for the database."
  type        = string
  sensitive   = true
}

variable "db_subnet_group_name" {
  description = "The DB subnet group name."
  type        = string
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot before deleting the DB instance."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to assign to the RDS instance."
  type        = map(string)
  default     = {
    Name = "MyRDSInstance"
  }
}
variable "action" {
  description = "Action to perform: Create or Delete"
  type        = string
}
