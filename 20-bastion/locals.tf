locals {
  instance_type =   "t3.micro"
  ami_id    =   data.aws_ami.devops_practice.id
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
  public_subnet_id = split("," , data.aws_ssm_parameter.public_subnet_id.value)[0]

  common_tags = {
        Project = var.project_name
        Environment = var.environment
        Terraform = "true"
    } 
}