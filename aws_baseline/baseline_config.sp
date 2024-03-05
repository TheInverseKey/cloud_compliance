benchmark "aws_baseline_config" {
  title         = "Config"
  children = [
    control.config_1,
    control.config_2_cis_v2_3_5
  ]
}

control "foundational_security_config_1" {
  title         = "1 AWS Config should be enabled"
  description   = "This control checks whether AWS Config is enabled in the account for the local Region and is recording all resources. The AWS Config service performs configuration management of supported AWS resources in your account and delivers log files to you. The recorded information includes the configuration item (AWS resource), relationships between configuration items, and any configuration changes between resources."
  severity      = "medium"
  sql           = aws_compliance.query.config_enabled_all_regions.sql
}

control "config_2_cis_v2_3_5" {
  title         = "3.5 Ensure CloudTrail logs are encrypted at rest using KMS CMKs"
  description   = "AWS CloudTrail is a web service that records AWS API calls for an account and makes those logs available to users and resources in accordance with IAM policies. AWS Key Management Service (KMS) is a managed service that helps create and control the encryption keys used to encrypt account data, and uses Hardware Security Modules (HSMs) to protect the security of encryption keys. CloudTrail logs can be configured to leverage server side encryption (SSE) and KMS customer created master keys (CMK) to further protect CloudTrail logs. It is recommended that CloudTrail be configured to use SSE-KMS."
  sql           = aws_compliance.query.cloudtrail_trail_logs_encrypted_with_kms_cmk.sql
  severity      = "high"
  
}