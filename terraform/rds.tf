resource "aws_security_group" "rds_sg" {
  name        = "tech-challenge-rds-sg"
  description = "Security group for RDS PostgreSQL from the TechChallenge APP"
  vpc_id      = data.aws_vpc.selected_vpc.id

  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "techchallenge_rds_subnet_group"
  subnet_ids = [for subnet in data.aws_subnet.selected_subnets : subnet.id]
}

resource "aws_db_instance" "order_db_postgres" {
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "13"
  instance_class         = "db.t3.micro"
  identifier             = "order-db"
  db_name                = local.tc_order_db_credentials["db_name"]
  username               = local.tc_order_db_credentials["username"]
  password               = local.tc_order_db_credentials["password"]
  parameter_group_name   = "default.postgres13"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  skip_final_snapshot = true

  depends_on = [
    aws_security_group.rds_sg,
    aws_db_subnet_group.rds_subnet_group,
    aws_secretsmanager_secret_version.tc_order_db_credentials_secret_version
  ]
}

resource "aws_db_instance" "production_db_postgres" {
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "13"
  instance_class         = "db.t3.micro"
  identifier             = "production-db"
  db_name                = local.tc_production_db_credentials["db_name"]
  username               = local.tc_production_db_credentials["username"]
  password               = local.tc_production_db_credentials["password"]
  parameter_group_name   = "default.postgres13"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  skip_final_snapshot = true

  depends_on = [
    aws_security_group.rds_sg,
    aws_db_subnet_group.rds_subnet_group,
    aws_secretsmanager_secret_version.tc_production_db_credentials_secret_version
  ]
}