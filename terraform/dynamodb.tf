resource "aws_dynamodb_table" "jobs_table" {
  name             = "Jobs"
  hash_key         = "id"
  read_capacity    = "10"
  write_capacity   = "10"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "dynamodb-table"
  }
}