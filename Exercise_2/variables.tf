# TODO: Define the variable for aws_region
variable "region" {
     type = string
     description = "aws region"
     default = "<replace by your region>"
}
variable "access_key" {
    type = string
    description = "aws access key"
    default = "<replace by your access_key>"
}
variable "secret_key" {
    type = string
    description = "aws secret key"
    default = "<replace by your secrect_key>"
}

variable "token"  {
    type = string
    description = "aws temporary token"
    default = "<replace by your token>"
}

variable "lambda_function_name" {
  default = "greeting_lambda_udacity"
}

  