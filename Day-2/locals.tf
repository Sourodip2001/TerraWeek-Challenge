locals {

  name_prefix = upper("${var.environment}-terraweek")

  merged_tags = merge(
    var.common_tags,
    {
      Environment = var.environment
    }
  )

  joined_users = join(", ", var.allowed_users)

  total_regions = length(var.regions)

  formatted_name = format(
    "%s-%s",
    var.environment,
    var.container_name
  )

  upper_users = [
    for user in var.allowed_users :
    upper(user)
  ]

  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
}
