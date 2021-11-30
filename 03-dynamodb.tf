
resource "aws_dynamodb_table" "sales_order_table" {
  name           = "salesorder"
  read_capacity  = "20"
  write_capacity = "20"
  hash_key       = "PK"
  range_key      = "SK"

  attribute {
    name = "PK"
    type = "S"
  }

  attribute {
    name = "SK"
    type = "S"
  }
}