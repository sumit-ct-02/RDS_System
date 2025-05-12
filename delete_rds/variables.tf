variable "region" {
    type = string
    default = "ap-south-1"
}
variable "db_identifier" {
    type = string
    description = "DB Identifier to Delete RDS instance"
}
variable "action" {
  description = "Action to perform: Create or Delete"
  type        = string
}
