#the first sintese is to export the value of our ngnit_sg security group
output "ngnit_sg_group_id" {
  value = aws_security_group.NGNIT_sg.id
}
# the next sentese is to export the value of ecs container security group
output "ecs_security_group_id" {
  value = aws_security_group.ecs_security_group.id
}
# NB we will need this when creating other resources. 