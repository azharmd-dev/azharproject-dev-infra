resource "aws_instance" "mongodb" {
      ami = local.ami_id
      vpc_security_group_ids = [local.mongodb_sg_id]
      instance_type = local.instance_type
      subnet_id = local.database_subnet_id
      tags = merge(
        local.common_tags,
        {
          Name  = "${local.common_name_suffix}-mongodb"
        }
      )
    }

resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id,
  ]

connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = aws_instance.mongodb.private_ip
}

  provisioner "remote-exec" {
    inline = [ 
        "echo This is Azhar"
     ]  
    }
}