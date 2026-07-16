resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = merge(
    {
      Name        = "${var.name}-${var.environment}-server"
      Environment = var.environment
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}