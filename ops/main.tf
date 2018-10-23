variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "ami_id" {}
variable "key_name" {}

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

  provisioner "file" {
    source      = "../app.py"
    destination = "~/app.py"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }

  provisioner "file" {
    source      = "../scripts/provision.sh"
    destination = "/tmp/provision.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provision.sh",
      "chmod +x ~/app.py",
      "/tmp/provision.sh",
      "python3 ~/app.py &",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }
}

output "public_IP" {
  value = "${aws_instance.app01.public_ip}"
}
