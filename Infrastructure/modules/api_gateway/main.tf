# Defines an AWS API Gateway REST API.
resource "aws_api_gateway_rest_api" "rest_api" {
  count       = var.api_gateway_type == "REST" ? 1 : 0
  name        = var.api_name
  description = var.api_description

  # Specifies the endpoint type (REGIONAL, EDGE, PRIVATE).
  endpoint_configuration {
    types = [var.endpoint_type]
  }

  # Merges predefined global tags (`default_tags`) with the API-specific tag for easier resource tracking.
  tags = merge(var.default_tags, {
    "Name" = var.api_name
  })
}

# Defines an AWS API Gateway HTTP API.
resource "aws_api_gateway_http_api" "http_api" {
  count       = var.api_gateway_type == "HTTP" ? 1 : 0
  name        = var.api_name
  description = var.api_description

  # Applies default tags to the HTTP API for consistency in resource tracking.
  tags = merge(var.default_tags, { "Name" = var.api_name })
}

# Defines an AWS API Gateway WebSocket API for real-time communication.
resource "aws_api_gateway_websocket_api" "websocket_api" {
  count       = var.api_gateway_type == "WEBSOCKET" ? 1 : 0
  name        = var.api_name
  description = var.api_description

  # Ensures global tagging for organized resource management.
  tags = merge(var.default_tags, { "Name" = var.api_name })
}

# Defines a resource path inside the REST API, applicable only for REST API types.
resource "aws_api_gateway_resource" "rest_resource" {
  count       = var.api_gateway_type == "REST" ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.rest_api[0].id
  parent_id   = aws_api_gateway_rest_api.rest_api[0].root_resource_id
  path_part   = var.resource_path # Defines the subpath within the API structure.
}

# Defines a route for HTTP API requests.
resource "aws_apigatewayv2_route" "http_route" {
  count     = var.api_gateway_type == "HTTP" ? 1 : 0
  api_id    = aws_apigatewayv2_api.http_api[0].id
  route_key = "${var.http_method} ${var.resource_path}"                             # Defines HTTP method and API route.
  target    = "integrations/${aws_apigatewayv2_integration.http_integration[0].id}" # Specifies integration target.
}

# Defines a route for WebSocket API requests.
resource "aws_apigatewayv2_route" "websocket_route" {
  count     = var.api_gateway_type == "WEBSOCKET" ? 1 : 0
  api_id    = aws_apigatewayv2_api.websocket_api[0].id
  route_key = "$default" # `$default` catches unmatched WebSocket messages.
}

# Configures the method for API requests (e.g., GET, POST), applies only to REST API.
resource "aws_api_gateway_method" "method" {
  rest_api_id   = var.api_gateway_type == "REST" ? aws_api_gateway_rest_api.rest_api[0].id : null
  resource_id   = var.api_gateway_type == "REST" ? aws_api_gateway_resource.rest_resource[0].id : null
  http_method   = var.api_gateway_type == "REST" ? var.http_method : "ANY" # Defaults to "ANY" if not specified.
  authorization = "NONE"                                                   # Disables authorization for simplicity.

  # Configures request parameters, enabling query string validation.
  request_parameters = {
    "method.request.querystring.user_id" = true # Requires user ID in query string.
  }
}

# Configures caching settings for API responses, applies only to REST API.
resource "aws_api_gateway_method_settings" "cache_settings" {
  rest_api_id = var.api_gateway_type == "REST" ? aws_api_gateway_rest_api.rest_api[0].id : null
  stage_name  = var.api_gateway_type == "REST" ? var.stage_name : null
  method_path = var.api_gateway_type == "REST" ? "${aws_api_gateway_resource.rest_resource[0].path_part}/${var.http_method}" : null

  # Enables caching dynamically based on `enable_caching` variable.
  settings {
    caching_enabled      = var.enable_caching
    cache_ttl_in_seconds = var.enable_caching ? 300 : 0 # Cache responses for 5 minutes if enabled, else disabled.
  }
}

# Links API Gateway to a Lambda function for request processing.
resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = var.api_gateway_type == "REST" ? aws_api_gateway_rest_api.rest_api[0].id : null
  resource_id             = var.api_gateway_type == "REST" ? aws_api_gateway_resource.rest_resource[0].id : null
  http_method             = var.api_gateway_type == "REST" ? var.http_method : null
  integration_http_method = "POST"
  type                    = "AWS_PROXY"           # Enables AWS Lambda proxy integration.
  uri                     = var.lambda_invoke_arn # Specifies Lambda function to be invoked.

  # Enables response caching dynamically.
  cache_key_parameters = var.enable_caching ? ["method.request.querystring.user_id"] : []
  cache_namespace      = "mycache" # Defines cache namespace for API responses.
}
