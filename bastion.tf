resource "aws_instance" "bastion" {
    ami = data.aws_ami.bastion.id  
    instance_type = var.bastion_instance_type 
    key_name = aws_key_pair.management.id  
    vpc_security_group_ids = [aws_security_group.bastion_host.id]
    subnet_id = element(aws_subnet.public_subnets, 0).id  
    associate_public_ip_address = true

    tags = {
        Name = "bastion"
        Author = var.Author
    }
}

resource "aws_key_pair" "management" {
    key_name = "management"
    public_key = file(var.public_key)
}

resource "aws_security_group" "bastion_host" {
  name = "bastion_sg_${var.vpc_name}"
  description = "Allow SSH from anywhere"
  vpc_id =  aws_vpc.management.id  

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 0
      to_port = 0
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "bastion_sg_${var.vpc_name}"
      Author = var.Author
  }
}