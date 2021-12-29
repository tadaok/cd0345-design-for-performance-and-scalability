provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  token      = var.token
}

#ZIP
data "archive_file" "lambda_function" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = "lambda.zip"
}

#Lambda
resource "aws_lambda_function" "greeting" {
  filename      = "lambda.zip"
  function_name = var.lambda_function_name
  role          = aws_iam_role.iam_for_greeting_lambda.arn
  handler       = "greet_lambda.lambda_handler"
  runtime       = "python3.8"

  environment {
    variables = {
      greeting = "Hello"
    }
  }
  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.greeting_lambda
  ]

}


resource "aws_iam_role" "iam_for_greeting_lambda" {
  name = "iam_for_greeting_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_cloudwatch_log_group" "greeting_lambda" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 14
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_greeting_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}
