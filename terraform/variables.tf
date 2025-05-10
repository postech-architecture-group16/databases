variable "aws_region" {
  type = string
  default = "us-east-1"
  description = "AWS Account Region"
}

variable "order_db_credentials" {
  type = map(string)
  default = {
    username = "postgres"
    password = "123456"
    db_name  = "postgres"
  }
}

variable "production_db_credentials" {
  type = map(string)
  default = {
    username = "postgres"
    password = "123456"
    db_name  = "postgres"
  }
}
