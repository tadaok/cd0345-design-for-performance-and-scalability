# TODO: Define the variable for aws_region
variable "aws_region" {
     type = string
     description = "AWS region"
     default = "us-east-1"
}

variable "lambda_function_name" {
  default = "greeting_lambda_udacity"
}

  