//ec2.tf

resource "aws_instance" "terratest_instance" {
    ami = "ami-025a6a5beb74db87b"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.terratest_subnet.id
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
    tags = {
      Name = "terratest_instance"
    }
}