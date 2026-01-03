resource "aws_instance" "jenkins_ec2" {
  ami           = "ami-00ca570c1b6d79f36"   # Amazon Linux 2 (Mumbai)
  instance_type = "t3.micro"
  key_name      = "terraform"

  tags = {
    Name = "Terraform-Jenkins-EC2"
  }
}
