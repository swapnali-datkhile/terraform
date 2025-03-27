# Defining map data type
variable "inst_type" {         
  type = map(string)
  default = {
    us-east-1 = "t2.micro"
    ap-south-1 = "m5.large"
    eu-west-1 = "t2.small"
  }
}

# Defining list data type
variable "ami-list" {
  type = list(string)
  default = [ "ami-04adc082cd8225313","ami-076c6dbba59aa92e6","ami-002018463825bbc26" ]
}

# Creating EC2 instance by referencing data from map & list 
resource "aws_instance" "myec2" {
  ami = var.ami-list[1]                                      # list[index] = value  ==  var.ami-list[1] = ami-076c6dbba59aa92e6    (indexing starts from 0)
  instance_type = var.inst_type["ap-south-1"]                # map["key"] = value   ==  var.inst_type["ap-south-1"] = "m5.large"
  tags = {
    Name = "myinstance"
  }
}

# Defining output
output "ami-value" {
  value = aws_instance.myec2.ami
}
output "myec2-inst_type" {
  value = aws_instance.myec2.instance_type
}
