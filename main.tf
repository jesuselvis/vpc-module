resource "aws_vpc" "vpc-escuelita" {
  cidr_block = var.vpc_cidr_block
  
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "subnet-pub" {
  count = length(var.subnet_cidr_block_pub)
  vpc_id = aws_vpc.vpc-escuelita.id
  cidr_block = var.subnet_cidr_block_pub[count.index]
  availability_zone = var.azs[count.index]
  
  tags = {
    Name = "subnet-pub-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw_escuelita" {
 vpc_id = aws_vpc.vpc-escuelita.id
 tags = {
   Name = "igw-escuelita"
 }
}

resource "aws_route_table" "rt-escuelita" {
  vpc_id = aws_vpc.vpc-escuelita.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_escuelita.id
  }
  tags = {
    Name = "rt-escuelita"
  }
}

resource "aws_route_table_association" "rta-escuelita" {
  count = length(var.azs)
  route_table_id = aws_route_table.rt-escuelita.id
  subnet_id = aws_subnet.subnet-pub[count.index].id
}

resource "aws_subnet" "subnet-priv" {
  count = length(var.subnet_cidr_block_pub)
  vpc_id = aws_vpc.vpc-escuelita.id
  cidr_block = var.subnet_cidr_block_priv[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    Name = "subnet-priv-${count.index + 1}"
  }
}