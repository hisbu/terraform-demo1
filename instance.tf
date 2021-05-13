resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "web" {
  ami           = var.AWS_AMIS[var.AWS_REGION]
  instance_type = var.AWS_INSTANCE_TYPE
  key_name      = aws_key_pair.mykey.key_name
  # user_data = <<-EOF
  #                 #! /bin/bash
  #                 sudo apt-get update
  #                 sudo apt-get install -y apache2
  #                 sudo systemctl start apache2
  #                 sudo systemctl enable apache2
  #                 echo '<h1>Deployed via Terraform</h1>' | sudo tee /var/www/html/index.html
  #               EOF

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.web.private_ip} >> private_ips.txt"
  }

  tags = {
    Name = "HelloTerraform"
  }
}

output "ip_instance_web" {
  value = aws_instance.web.public_ip
}
