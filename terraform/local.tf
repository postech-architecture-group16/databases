locals {
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b"]
  order_db_credentials = jsondecode(data.aws_secretsmanager_secret_version.order_db_credentials_secret_version.secret_string)
  production_db_credentials = jsondecode(data.aws_secretsmanager_secret_version.production_db_credentials_secret_version.secret_string)
}