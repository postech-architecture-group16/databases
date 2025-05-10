resource "aws_secretsmanager_secret" "order_db_credentials_secret" {
  name        = "order-db-credentials"
  description = "Database credentials for Order db PostgreSQL RDS Instance from Techchallenge APP"

  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret" "production_db_credentials_secret" {
  name        = "tech-challenge-production-db-credentials"
  description = "Database credentials for Cook db PostgreSQL RDS Instance from Techchallenge APP"

  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "order_db_credentials_secret_version" {
  secret_id     = aws_secretsmanager_secret.order_db_credentials_secret.id
  secret_string = jsonencode(var.order_db_credentials)

  depends_on = [aws_secretsmanager_secret.order_db_credentials_secret]
}

resource "aws_secretsmanager_secret_version" "production_db_credentials_secret_version" {
  secret_id     = aws_secretsmanager_secret.production_db_credentials_secret.id
  secret_string = jsonencode(var.production_db_credentials)

  depends_on = [aws_secretsmanager_secret.production_db_credentials_secret]
}