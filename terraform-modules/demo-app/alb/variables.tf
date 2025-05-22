variable "app_name" {

}

variable "instance_type" {

}

variable "public_subnets_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
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

