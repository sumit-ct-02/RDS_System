variable "region" {
    type = string
    default = "ap-south-1"
}
variable "rds_id" {
    type = string
    description = "RDS ID to Delete RDS instance"
}
variable "action" {
  description = "Action to perform: Create or Delete"
  type        = string
}
