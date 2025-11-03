resource "aws_instance" "bastion" {
      ami = local.ami_id
      vpc_security_group_ids = [local.bastion_sg_id]
      instance_type = local.instance_type
      subnet_id = local.public_subnet_id
      associate_public_ip_address = true
      user_data = file("bastion.sh")
      tags = merge(
        local.common_tags,
        {
          Name  = "${var.project_name}-${var.environment}-bastion"
        }
      )
      
    }