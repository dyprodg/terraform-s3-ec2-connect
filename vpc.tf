//vpc.tf

resource "aws_vpc" "terratest" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "terratest"
  }
}

resource "aws_subnet" "terratest_subnet" {
  vpc_id = aws_vpc.terratest.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "terratest_subnet"
  }
}