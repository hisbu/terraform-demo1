resource "aws_instance" "web" {
  ami           = var.AWS_AMIS[var.AWS_REGION]
  instance_type = var.AWS_INSTANCE_TYPE

  tags = {
    Name = "HelloTerraform"
  }
}

resource "aws_instance" "web2" {
  ami           = var.AWS_AMIS[var.AWS_REGION]
  instance_type = var.AWS_INSTANCE_TYPE

  tags = {
    Name = "HelloTerraform"
  }
}