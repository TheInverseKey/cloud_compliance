benchmark "aws_baseline_codebuild" {
  title         = "CodeBuild"
  children = [
    control.codebuild_1,
    control.codebuild_2,
    control.codebuild_3,
    control.codebuild_4,
    control.codebuild_5
  ]
}


control "codebuild_1" {
  title         = "1 CodeBuild GitHub or Bitbucket source repository URLs should use OAuth"
  description   = "Authentication credentials should never be stored or transmitted in clear text or appear in the repository URL. Instead of personal access tokens or user name and password, you should use OAuth to grant authorization for accessing GitHub or Bitbucket repositories. Using personal access tokens or a user name and password could expose your credentials to unintended data exposure and unauthorized access."
  severity      = "critical"
  sql           = aws_compliance.query.codebuild_project_source_repo_oauth_configured
}

control "codebuild_2" {
  title         = "2 CodeBuild project environment variables should not contain clear text credentials"
  description   = "This control checks whether the project contains the environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY. Authentication credentials AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY should never be stored in clear text, as this could lead to unintended data exposure and unauthorized access."
  severity      = "critical"
  sql           = aws_compliance.query.codebuild_project_plaintext_env_variables_no_sensitive_aws_values
}

control "codebuild_3" {
  title         = "3 CodeBuild S3 logs should be encrypted"
  description   = "This control checks if Amazon S3 logs for an AWS CodeBuild project are encrypted. The control fails if encryption is deactivated for S3 logs for a CodeBuild project."
  severity      = "low"
  sql           = aws_compliance.query.codebuild_project_s3_logs_encryption_enabled
}

control "codebuild_4" {
  title         = "4 CodeBuild project environments should have a logging configuration"
  description   = "This control checks whether a CodeBuild project environment has at least one log option, either to S3 or CloudWatch logs enabled. This control fails if a CodeBuild project environment does not have at least one log option enabled."
  severity      = "medium"
  sql           = aws_compliance.query.codebuild_project_logging_enabled
}

control "codebuild_5" {
  title         = "5 CodeBuild project environments should not have privileged mode enabled"
  description   = "This control checks if an AWS CodeBuild project environment has privileged mode enabled. This control fails when an AWS CodeBuild project environment has privileged mode enabled."
  severity      = "high"
  sql           = aws_compliance.query.codebuild_project_environment_privileged_mode_disabled
}
