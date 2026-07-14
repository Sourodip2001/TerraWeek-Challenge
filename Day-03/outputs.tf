output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet" {
  value = aws_subnet.public.id
}

output "instance_public_ips" {
  value = aws_instance.web[*].public_ip
}

output "elastic_ip" {
  value = aws_eip.web.public_ip
}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

output "ami_id" {
  value = data.aws_ami.amazon_linux.id
}