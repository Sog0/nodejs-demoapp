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
