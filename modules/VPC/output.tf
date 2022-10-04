# this will be use to export some value in the vpc module we can referent the valur when we create other resources
# let start by exporting our region from variable module
output "region" {
  value = var.region
}
# exporting the project name
output "project_name" {
  value = var.project_name
}

# exporting vpc id
output "vpc_id" {
  value = aws_vpc.vpc.id
}
# export public subnet az1
output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}
# export public subnet az2
output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet_az2.id
}
# export private app subnet az1
output "private_app_subnet_az1_id" {
  value = aws_subnet.private_app_subnet_az1.id
}
# export private app subnet az2
output "private_app_subnet_az2_id" {
  value = aws_subnet.private_app_subnet_az2.id
}
# export private data subnet az1
output "private_data_subnet_az1_id" {
  value = aws_subnet.private_data_subnet_az1.id
}
# export private data subnet az2
output "private_data_subnet_az2_id" {
  value = aws_subnet.private_data_subnet_az2.id
}
# export the internet gateway 
output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway
}