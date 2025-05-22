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
    user_data = "${get_parent_terragrunt_dir()}/user_data/user_data.sh"
    public_subnet_ids = dependency.vpc.outputs.public_subnet_ids
    security_group_id = dependency.vpc.outputs.security_group_id
    vpc_id = dependency.vpc.outputs.vpc_id
    target_group_arn = dependency.alb.outputs.target_group_arn
  }

