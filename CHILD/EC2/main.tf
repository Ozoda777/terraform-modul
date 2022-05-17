resource "aws_instance" "chils_instance" {
    ami = var.ami_id
    instan_type = var.instance_type
    # subnet_id = var.subnet_id
    tags = {
        "Name" = "${var.server_tag}"
    }
}
resource "aws_subnet" "public_subnet" {
    vpc_id = 
}