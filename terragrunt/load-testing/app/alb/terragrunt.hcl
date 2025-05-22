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
  vpc_id = dependency.vpc.outputs.vpc_id
  public_subnet_ids = dependency.vpc.outputs.public_subnet_ids
  security_group_id = dependency.vpc.outputs.security_group_id
}
