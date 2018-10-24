variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "ami_id" {}
variable "key_name" {}
variable "ssh_username" {}

variable "vpc_security_group_ids" {
  type    = "list"
  default = ["sg-0104bd2e830bc7973"]
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-2"
}

resource "aws_instance" "app01" {
  ami                    = "${var.ami_id}"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"

  connection = {
    type        = "ssh"
    user        = "${var.ssh_username}"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "../app.py"
    destination = "~/app.py"
  }

  provisioner "file" {
    source      = "../scripts/provision.sh"
    destination = "/tmp/provision.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provision.sh",
      "chmod +x ~/app.py",
      "bash -x /tmp/provision.sh",
    ]
  }
}

output "public_IP" {
  value = "${aws_instance.app01.public_ip}"
}
