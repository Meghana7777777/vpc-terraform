output "vpc_id" {
  value = aws_vpc.vpc-sample.id
}

output "public_subnet_id" {
  value = aws_subnet.publicsubnets.id
}

output "private_subnet_id" {
  value = aws_subnet.privatesubnets.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.Igw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.NATgw.id
}
