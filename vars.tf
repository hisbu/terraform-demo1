variable "AWS_ACCESS_KEY" {
  type = string
  description = "access key for aws account"
}

variable "AWS_SECRET_KEY" {
  type = string
  description = "secret key for aws account"
}

# variable "AWS_REGION" {
#   type = list
#   description = "region for aws resource"
#   default = ["ap-southeast-1","ap-southeast-2","us-east-1"]
# }

variable "AWS_REGION" {
  type = string
  description = "region for aws resource"
  default = "us-east-1"
}

variable "AWS_AMIS" {
  type = map(string)
  description = "map of aws amis id"
  default = {
    ap-southeast-1 = "ami-0c20b8b385217763f"
    ap-southeast-2 = "ami-07fbdcfe29326c4fb"
    us-east-1 = "ami-0885b1f6bd170450c"
  }
}

variable "AWS_INSTANCE_TYPE" {
  type = string
  description = "type of aws ec2 instance"
  default = "t2.micro"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  type = string
  default = "ubuntu"
}