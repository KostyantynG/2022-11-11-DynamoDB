resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "Jobs"
  hash_key       = "id"    
  read_capacity  = "10"
  write_capacity = "10"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "dynamodb-table"
  }
}