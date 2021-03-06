provider "aws" {
  region=var.region
}

resource "aws_instance" "Tomcat-Server" {
    ami = "ami-0a4a70bd98c6d6441"
    instance_type = "t2.micro"
    tags = {
        Name = "Tomcat-Server"
    }
    key_name = "ap-south-demokey"
    user_data = data.template_file.asg_init.rendered
}

data "template_file" "asg_init" {
  template = file("${path.module}/userdata.tpl")
}
