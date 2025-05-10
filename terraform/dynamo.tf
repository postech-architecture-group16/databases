resource "aws_dynamodb_table" "payment_db" {
  name           = "payment_entity"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }
}