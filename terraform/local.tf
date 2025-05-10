locals {
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b"]
  tc_order_db_credentials = jsondecode(aws_secretsmanager_secret_version.tc_order_db_credentials_secret_version.secret_string)
  tc_production_db_credentials = jsondecode(aws_secretsmanager_secret_version.tc_production_db_credentials_secret_version.secret_string)
}