output "vpc_id" {
  description = "ID of the VPC"
  value       = module.my_vpc.vpc_id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = module.my_subnet.subnet_id
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "security_group_id" {
  value = module.my_sg.security_group_id
}