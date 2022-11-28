resource "aws_lambda_function" "job_notifier" {
  function_name = "notifier"
  filename      = "build/notifier.zip"
  handler       = "notifier.handler"
  role          = "arn:aws:iam::874515606678:role/LabRole"
  runtime       = "python3.9"
  timeout       = "120"

  environment {
    variables = {
      TOPIC_ARN = aws_sns_topic.jobs_topic.arn
    }
  }
}


resource "aws_sns_topic" "jobs_topic" {
  name = "jobstopic"
}

resource "aws_lambda_event_source_mapping" "job_table_update" {
  event_source_arn  = aws_dynamodb_table.jobs_table.stream_arn
  function_name     = aws_lambda_function.job_notifier.arn
  starting_position = "LATEST"
}

resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.jobs_topic.arn
  protocol  = "email"
  endpoint  = "funyourmind@gmail.com"
}