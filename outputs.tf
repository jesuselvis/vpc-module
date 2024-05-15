
output "vpc_id" {
  description = "id de la vpc"
  value = aws_vpc.vpc-escuelita.id
}

output "subnet-pub_id" {
  description = "ids de las sub-pub"
  value = aws_subnet.subnet-pub[*].id
}

output "subnet-priv_id" {
  description = "ids de las sub-pub"
  value = aws_subnet.subnet-priv[*].id
}