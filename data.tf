data "aws_ami" "bastion" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-2.0.20220207.1-x86_64-gp2"]
    }
}

data "http" "ip" {
    url = "http://ipv4.icanhazip.com"
}

