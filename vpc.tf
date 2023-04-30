 resource "aws_vpc" "vpc-sample" {               
   cidr_block       = var.vpc-sample_vpc_cidr
   instance_tenancy = "default"
 }

 resource "aws_subnet" "publicsubnets" {
   vpc_id =  aws_vpc.vpc-sample.id
   cidr_block = var.public_subnets
   map_public_ip_on_launch = true
 }

 resource "aws_subnet" "privatesubnets" {
   vpc_id =  aws_vpc.vpc-sample.id
   cidr_block = var.private_subnets
 }

 resource "aws_internet_gateway" "Igw" {    
    vpc_id =  aws_vpc.vpc-sample.id
 }

 resource "aws_eip" "nateIP" {
   vpc   = true
 }

 resource "aws_nat_gateway" "NATgw" {
   allocation_id = aws_eip.nateIP.id
   subnet_id = aws_subnet.publicsubnets.id
 }

 resource "aws_route_table" "PublicRT" {
    vpc_id =  aws_vpc.vpc-sample.id
    route {
    cidr_block = "0.0.0.0/0"  
    gateway_id = aws_internet_gateway.Igw.id
    }
 }

 resource "aws_route_table" "PrivateRT" {
   vpc_id = aws_vpc.vpc-sample.id
   route {
   cidr_block = "0.0.0.0/0"
   nat_gateway_id = aws_nat_gateway.NATgw.id
   }
 }

 resource "aws_route_table_association" "PublicRTassociation" {
    subnet_id = aws_subnet.publicsubnets.id
    route_table_id = aws_route_table.PublicRT.id
 }

 resource "aws_route_table_association" "PrivateRTassociation" {
    subnet_id = aws_subnet.privatesubnets.id
    route_table_id = aws_route_table.PrivateRT.id
 }
