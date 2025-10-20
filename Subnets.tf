resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = "172.20.0.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.test.id
  cidr_block        = "172.20.1.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "private-subnet-1"
  }
}
