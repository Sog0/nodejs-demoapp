include {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
  source = "../../../terraform-modules/demo-app/vpc"
}

inputs = {
  app_name        = "demoapp"
  instance_type   = "t2.micro"
  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
}

