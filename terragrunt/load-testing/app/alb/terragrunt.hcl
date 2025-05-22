include {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
  source = "../../../../terraform-modules/demo-app/alb"
}

dependency "vpc" {
  config_path = "../../vpc"

  mock_outputs = {
    vpc_id = "vpc-mock"
    public_subnet_ids = ["subnet-mock1", "subnet-mock2"]
    security_group_id = "sg-mock"
  }
}


inputs = {
  app_name = "demoapp"
  instance_type = "t2.micro"
  azs = ["us-east-1a", "us-east-1b"]
  public_subnets_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  vpc_id = dependency.vpc.outputs.vpc_id
  public_subnet_ids = dependency.vpc.outputs.public_subnet_ids
  security_group_id = dependency.vpc.outputs.security_group_id
}
