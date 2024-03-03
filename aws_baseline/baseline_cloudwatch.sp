benchmark "aws_baseline_cloudwatch" {
  title         = "CloudWatch/SecurityHub"
  children = [
    control.cloudwatch_cis_v200_4_1,
    control.cloudwatch_cis_v200_4_2,
    control.cloudwatch_cis_v200_4_3,
    control.cloudwatch_cis_v200_4_4,
    control.cloudwatch_cis_v200_4_5,
    control.cloudwatch_cis_v200_4_6,
    control.cloudwatch_cis_v200_4_7,
    control.cloudwatch_cis_v200_4_8,
    control.cloudwatch_cis_v200_4_9,
    control.cloudwatch_cis_v200_4_10,
    control.cloudwatch_cis_v200_4_11,
    control.cloudwatch_cis_v200_4_12,
    control.cloudwatch_cis_v200_4_13,
    control.cloudwatch_cis_v200_4_14,
    control.cloudwatch_cis_v200_4_15,
    control.cloudwatch_cis_v200_4_16
  ]
}

control "cloudwatch_cis_v200_4_1" {
  title         = "4.1 Ensure unauthorized API calls are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_unauthorized_api
}

control "cloudwatch_cis_v200_4_2" {
  title         = "4.2 Ensure management console sign-in without MFA is monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_console_login_mfa
}

control "cloudwatch_cis_v200_4_3" {
  title         = "4.3 Ensure usage of 'root' account is monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_root_login
}

control "cloudwatch_cis_v200_4_4" {
  title         = "4.4 Ensure IAM policy changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established changes made to Identity and Access Management (IAM) policies."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_iam_policy
}

control "cloudwatch_cis_v200_4_5" {
  title         = "4.5 Ensure CloudTrail configuration changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, where metric filters and alarms can be established. It is recommended that a metric filter and alarm be established changes made to Identity and Access Management (IAM) policies."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_cloudtrail_configuration
}

control "cloudwatch_cis_v200_4_6" {
  title         = "4.6 Ensure AWS Management Console authentication failures are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for failed console authentication attempts."
  severity      = "medium"
  sql           = aws_compliance.query.log_metric_filter_console_authentication_failure
}

control "cloudwatch_cis_v200_4_7" {
  title         = "4.7 Ensure disabling or scheduled deletion of customer created CMKs is monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for customer created CMKs which have changed state to disabled or scheduled deletion."
  severity      = "medium"
  sql           = aws_compliance.query.log_metric_filter_disable_or_delete_cmk
}

control "cloudwatch_cis_v200_4_8" {
  title         = "4.8 Ensure S3 bucket policy changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for changes to S3 bucket policies."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_bucket_policy
}

control "cloudwatch_cis_v200_4_9" {
  title         = "4.9 Ensure AWS Config configuration changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for detecting changes to AWS Config's configurations."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_config_configuration
}

control "cloudwatch_cis_v200_4_10" {
  title         = "4.10 Ensure security group changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms. Security Groups are a stateful packet filter that controls ingress and egress traffic within a VPC."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_security_group
}

control "cloudwatch_cis_v200_4_11" {
  title         = "4.11 Ensure Network Access Control Lists (NACL) changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms. NACLs are used as a stateless packet filter to control ingress and egress traffic for subnets within a VPC. It is recommended that a metric filter and alarm be established for changes made to NACLs."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_network_acl
}

control "cloudwatch_cis_v200_4_12" {
  title         = "4.12 Ensure changes to network gateways are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms. Network gateways are required to send/receive traffic to a destination outside of a VPC. It is recommended that a metric filter and alarm be established for changes to network gateways."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_network_gateway
}

control "cloudwatch_cis_v200_4_13" {
  title         = "4.13 Ensure route table changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms. Routing tables are used to route network traffic between subnets and to network gateways. It is recommended that a metric filter and alarm be established for changes to route tables."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_route_table
}

control "cloudwatch_cis_v200_4_14" {
  title         = "4.14 Ensure VPC changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms. It is possible to have more than 1 VPC within an account, in addition it is also possible to create a peer connection between 2 VPCs enabling network traffic to route between VPCs. It is recommended that a metric filter and alarm be established for changes made to VPCs."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_vpc
}

control "cloudwatch_cis_v200_4_15" {
  title         = "4.15 Ensure AWS Organizations changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for AWS Organizations changes made in the master AWS Account."
  severity      = "high"
  sql           = aws_compliance.query.log_metric_filter_organization
}

control "cloudwatch_cis_v200_4_16" {
  title         = "4.16 Ensure AWS Security Hub is enabled"
  description   = "Security Hub collects security data from across AWS accounts, services, and supported third-party partner products and helps you analyze your security trends and identify the highest priority security issues. When you enable Security Hub, it begins to consume, aggregate, organize, and prioritize findings from AWS services that you have enabled, such as Amazon GuardDuty, Amazon Inspector, and Amazon Macie. You can also enable integrations with AWS partner security products."
  severity      = "high"
  sql           = aws_compliance.query.securityhub_enabled
}
