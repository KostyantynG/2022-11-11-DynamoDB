resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "Jobs"
  hash_key       = "id"
  range_key      = "title"    
  read_capacity  = "10"
  write_capacity = "10"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "title"
    type = "S"
  }

  tags = {
    Name = "dynamodb-table"
  }
}