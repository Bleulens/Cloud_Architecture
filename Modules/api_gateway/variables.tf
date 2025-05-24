# Type of API Gateway (e.g., REST, HTTP).
variable "api_gateway_type" {
  type    = string
  default = "REST" # Default API type
}

# Name of the API Gateway instance.
variable "api_name" {
  type = string
}

# Optional description for the API.
variable "api_description" {
  type    = string
  default = "API Gateway for backend services"
}

# Type of API Gateway (e.g., REST, HTTP).
variable "endpoint_type" {
  type    = string
  default = "REGIONAL" # options: REGIONAL, EDGE, PRIVATE
}

# Path segment for API requests.
variable "resource_path" {
  type = string
}

# Defines multiple API paths dynamically using a map variable
variable "tasks" {
  type = map(string)
}

# HTTP method used (e.g., GET, POST).
variable "http_method" {
  type    = string
  default = "POST"
}

# Name of the API Gateway stage.
variable "stage_name" {
  type    = string
  default = "dev"
}

# Enable caching for API responses.
variable "enable_caching" {
  type    = bool
  default = false # Default to no caching unless explicitly enabled
}

# ARN of the Lambda function that will process API requests.
variable "lambda_invoke_arn" {
  type = string
}

# Global tags applied to all resources.
variable "default_tags" {
  type = map(string)
}
