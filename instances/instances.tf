variable "instanceNames" {
  type = list(string)
  default = [ "julian.montoyag.api.terraform", "julian.montoyag.ui.terraform", "julian.montoyag.db.terraform" ]
}

variable "project" {
  type = string
  default = "ramp-up-devops"
}

variable "responsible" {
  type = string
  default = "julian.montoyag"
}

variable "instanceType" {
  type = string
  default = "t2.micro"
}

variable "ami" {
    type = map
    default = {
        "amazon" = "ami-0a8a24772b8f01294"
    }
}

resource "aws_instance" "instance_terraform" {
  count = 3
  ami = var.ami.amazon
  instance_type = var.instanceType
  subnet_id = "subnet-055c41fce697f9cca"
  tags = {
    "project" = var.project
    "Name" = element(var.instanceNames, count.index)
    "responsible" = var.responsible
  }

  volume_tags = {
    "project" = var.project
    "responsible" = var.responsible
  }
}

output "instancesIds" {
  value = aws_instance.instance_terraform
}