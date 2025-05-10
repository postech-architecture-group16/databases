resource "aws_ssm_parameter" "order_rds_endpoint" {
  name  = "/fiap-tech-challenge/order-rds-endpoint"
  type  = "String"
  value = "jdbc:postgresql://${aws_db_instance.order_db_postgres.endpoint}/${local.tc_order_db_credentials["db_name"]}"
}

resource "aws_ssm_parameter" "production_rds_endpoint" {
  name  = "/fiap-tech-challenge/production-rds-endpoint"
  type  = "String"
  value = "jdbc:postgresql://${aws_db_instance.production_db_postgres.endpoint}/${local.tc_production_db_credentials["db_name"]}"
}