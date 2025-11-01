locals {
  instance_type =   "t3.micro"
  common_name_suffix ="${var.project_name}-${var.environment}"
  ami_id    =   data.aws_ami.devops_practice.id
  database_subnet_id = split("," , data.aws_ssm_parameter.database_subnet_id.value)[0]
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
  redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
  rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
  common_tags = {
        Project = var.project_name
        Environment = var.environment
        Terraform = "true"
    } 
}