variable "app_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_subnets_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "user_data" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "target_group_arn"{
  type = string
}