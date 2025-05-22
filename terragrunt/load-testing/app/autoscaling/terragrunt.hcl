include {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
  source = "../../../../terraform-modules/demo-app/autoscaling"
}

dependency "vpc" {
  config_path = "../../vpc"

  mock_outputs = {
    vpc_id = "vpc-mock"
    public_subnet_ids = ["subnet-mock1", "subnet-mock2"]
    security_group_id = "sg-mock"
  }
}

dependency "alb"{
  config_path = "../alb"

  mock_outputs = {
    target_group_arn = "arn:mock"
  }
}

inputs = {
    app_name = "demoapp"
    instance_type = "t2.micro"
    azs = ["us-east-1a", "us-east-1b"]
    public_subnets_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
    user_data = "${get_parent_terragrunt_dir()}/user_data/user_data.sh"
    public_subnet_ids = dependency.vpc.outputs.public_subnet_ids
    security_group_id = dependency.vpc.outputs.security_group_id
    vpc_id = dependency.vpc.outputs.vpc_id
    target_group_arn = dependency.alb.outputs.target_group_arn
  }

