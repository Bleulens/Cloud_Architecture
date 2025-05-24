module "iam" {
  source             = "../iam"
  policy_actions     = var.policy_actions
  deny_resources     = var.deny_resources
  deny_actions       = var.deny_actions
  enable_deny        = var.enable_deny
  assumed_by_service = var.assumed_by_service
  policy_resources   = var.policy_resources
  policy_name        = var.policy_name
  role_name          = var.role_name
  default_tags       = var.default_tags
}

module "cloud_watch" {
  source             = "../cloud_watch"
  log_group_name     = var.log_group_name
  log_stream_name    = var.log_stream_name
  instance_id        = var.instance_id
  application        = var.application
  metric_filter_name = var.metric_filter_name
  default_tags       = var.default_tags
}

# ✅ Only create the archive if using local deployment
data "archive_file" "lambda" {
  count       = var.deploy_via_s3 ? 0 : 1 # Conditional creation
  type        = "zip"
  source_file = var.source_file
  output_path = var.output_path
}


resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  function_name = var.function_name
  role          = module.iam.role_arn
  handler       = var.handler
  runtime       = var.runtime

  # ✅ Use either local filename OR S3-based deployment
  filename         = var.deploy_via_s3 ? null : var.output_path
  s3_bucket        = var.deploy_via_s3 ? var.s3_bucket : null
  s3_key           = var.deploy_via_s3 ? var.s3_key : null
  source_code_hash = var.deploy_via_s3 ? var.source_code_hash : data.archive_file.lambda[0].output_base64sha256


  environment {
    variables = merge(
      var.environment_variables, # ✅ Existing environment variables
      {
        log_group_name     = module.cloud_watch.log_group_name  # ✅ Dynamically pulling CloudWatch logs
        log_stream_name    = module.cloud_watch.log_stream_name # ✅ Ensuring logs are captured
        metric_filter_name = module.cloud_watch.metric_filter_name
      }
    )
  }

}
