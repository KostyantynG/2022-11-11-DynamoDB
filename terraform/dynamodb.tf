resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "GameScores"
  hash_key       = "UserId"
  range_key      = "GameTitle"
  read_capacity  = "10"
  write_capacity = "10"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table"
  }
}