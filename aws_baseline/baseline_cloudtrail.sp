benchmark "aws_baseline_cloudtrail" {
  title         = "CloudTrail"
  children = [
    control.cloudtrail_cis_3.1,
    control.cloudtrail_1,
    control.cloudtrail_2,
    control.cloudtrail_4,
    control.cloudtrail_5,
    control.cloudtrail_cis_3.3,
    control.cloudtrail_cis_3.6,
    control.cloudtrail_cis_3.7
  ]
}
control "cloudtrail_cis_3.1" {
  title         = "3.1 Ensure CloudTrail is enabled in all regions"
  description   = "AWS CloudTrail is a web service that records AWS API calls for your account and delivers log files to you. The recorded information includes the identity of the API caller, the time of the API call, the source IP address of the API caller, the request parameters, and the response elements returned by the AWS service. CloudTrail provides a history of AWS API calls for an account, including API calls made via the Management Console, SDKs, command line tools, and higher-level AWS services (such as CloudFormation)."
  sql           = aws_compliance.query.cloudtrail_multi_region_read_write_enabled.sql
}

control "cloudtrail_1" {
  title         = "1 CloudTrail should be enabled and configured with at least one multi-Region trail"
  description   = "This control checks that there is at least one multi-Region CloudTrail trail."
  severity      = "high"
  sql           = aws_compliance.query.cloudtrail_multi_region_trail_enabled.sql
}

control "cloudtrail_2" {
  title         = "2 CloudTrail should have encryption at rest enabled"
  description   = "This control checks whether CloudTrail is configured to use the server-side encryption (SSE) AWS Key Management Service customer master key (CMK) encryption. The check passes if the KmsKeyId is defined."
  severity      = "medium"
  sql           = aws_compliance.query.cloudtrail_trail_logs_encrypted_with_kms_cmk.sql
}

control "cloudtrail_4" {
  title         = "4 Ensure CloudTrail log file validation is enabled"
  description   = "This control checks whether log file integrity validation is enabled on a CloudTrail trail. CloudTrail log file validation creates a digitally signed digest file that contains a hash of each log that CloudTrail writes to Amazon S3. You can use these digest files to determine whether a log file was changed, deleted, or unchanged after CloudTrail delivered the log."
  severity      = "low"
  sql           = aws_compliance.query.cloudtrail_trail_validation_enabled.sql
}

control "cloudtrail_5" {
  title         = "5 Ensure CloudTrail trails are integrated with Amazon CloudWatch Logs"
  description   = "This control checks whether CloudTrail trails are configured to send logs to CloudWatch Logs. The control fails if the CloudWatchLogsLogGroupArn property of the trail is empty."
  severity      = "low"
  sql           = aws_compliance.query.cloudtrail_trail_integrated_with_logs.sql
}


control "cloudtrail_cis_3.3" {
  title         = "3.3 Ensure the S3 bucket used to store CloudTrail logs is not publicly accessible"
  description   = "CloudTrail logs a record of every API call made in your AWS account. These logs file are stored in an S3 bucket. It is recommended that the bucket policy or access control list (ACL) applied to the S3 bucket that CloudTrail logs to prevent public access to the CloudTrail logs."
  severity      = "high"
  sql           = aws_compliance.query.cloudtrail_bucket_not_public.sql
}

control "cloudtrail_cis_3.6" {
  title         = "3.6 Ensure S3 bucket access logging is enabled on the CloudTrail S3 bucket"
  description   = "S3 Bucket Access Logging generates a log that contains access records for each request made to your S3 bucket. An access log record contains details about the request, such as the request type, the resources specified in the request worked, and the time and date the request was processed. It is recommended that bucket access logging be enabled on the CloudTrail S3 bucket."
  severity      = "medium"
  sql           = aws_compliance.query.cloudtrail_s3_logging_enabled.sql
}

control "cloudtrail_cis_3.7" {
  title         = "3.7 Ensure CloudTrail logs are encrypted at rest using KMS CMKs"
  description   = "AWS CloudTrail is a web service that records AWS API calls for an account and makes those logs available to users and resources in accordance with IAM policies. AWS Key Management Service (KMS) is a managed service that helps create and control the encryption keys used to encrypt account data, and uses Hardware Security Modules (HSMs) to protect the security of encryption keys. CloudTrail logs can be configured to leverage server side encryption (SSE) and KMS customer created master keys (CMK) to further protect CloudTrail logs. It is recommended that CloudTrail be configured to use SSE-KMS."
  severity      = "high"
  sql           = aws_compliance.query.cloudtrail_trail_logs_encrypted_with_kms_cmk.sql
}