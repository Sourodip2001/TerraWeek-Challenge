variables {
  vpc_cidr = "10.0.0.0/16"
}

run "verify_instance_generation_properties" {
  command = plan

  assert {
    # Changed from module.vpc.cidr to module.vpc.vpc_cidr_block
    condition     = module.vpc.vpc_cidr_block == "10.0.0.0/16"
    error_message = "VPC CIDR network configuration value mismatch."
  }

  assert {
    condition     = length(module.vpc.public_subnets) == 2
    error_message = "Public network allocations must be distributed across exactly 2 zones."
  }
}