benchmark "aws_baseline_iam" {
  title         = "IAM"
  children = [
    control.iam_1,
    control.iam_2,
    control.iam_3,
    control.iam_4,
    control.iam_5,
    control.iam_6,
    control.iam_7,
    control.iam_8,
    control.iam_21,
    control.iam_cis_v200_1_9,
    control.iam_cis_v200_1_12,
    control.iam_cis_v200_1_13,
    control.iam_cis_v200_1_14,
    control.iam_cis_v200_1_15,
    control.iam_cis_v200_1_17,
    control.iam_cis_v200_1_18,
    control.iam_cis_v200_1_19,
    control.iam_cis_v200_1_20
  ]
}

control "iam_1" {
  title         = "1 IAM policies should not allow full '*' administrative privileges"
  description   = "This control checks whether the default version of IAM policies (also known as customer managed policies) has administrator access that includes a statement with 'Effect': 'Allow' with 'Action': '*' over 'Resource': '*'. The control only checks the customer managed policies that you create. It does not check inline and AWS managed policies."
  severity      = "high"
  sql           = aws_compliance.query.iam_policy_custom_attached_no_star_star.sql
}

control "iam_2" {
  title         = "2 IAM users should not have IAM policies attached"
  description   = "This control checks that none of your IAM users have policies attached. Instead, IAM users must inherit permissions from IAM groups or roles."
  severity      = "low"
  sql           = aws_compliance.query.iam_user_no_inline_attached_policies.sql
}

control "iam_3" {
  title         = "3 IAM users' access keys should be rotated every 90 days or less"
  description   = "This control checks whether the active access keys are rotated within 90 days."
  severity      = "medium"
  sql           = aws_compliance.query.iam_user_access_key_age_90.sql
}

control "iam_4" {
  title         = "4 IAM root user access key should not exist"
  description   = "This control checks whether the root user access key is present. The root account is the most privileged user in an AWS account. AWS access keys provide programmatic access to a given account."
  severity      = "critical"
  sql           = aws_compliance.query.iam_root_user_no_access_keys.sql
}

control "iam_5" {
  title         = "5 MFA should be enabled for all IAM users that have a console password"
  description   = "This control checks whether AWS multi-factor authentication (MFA) is enabled for all IAM users that use a console password."
  severity      = "medium"
  sql           = aws_compliance.query.iam_user_console_access_mfa_enabled.sql
}

control "iam_6" {
  title         = "6 Hardware MFA should be enabled for the root user"
  description   = "This control checks whether your AWS account is enabled to use a hardware multi-factor authentication (MFA) device to sign in with root user credentials."
  severity      = "critical"
  sql           = aws_compliance.query.iam_root_user_hardware_mfa_enabled.sql
}

control "iam_7" {
  title         = "7 Password policies for IAM users should have strong configurations"
  description   = "This control checks whether the account password policy for IAM users uses the recommended configurations."
  severity      = "medium"
  sql           = aws_compliance.query.iam_account_password_policy_strong_min_length_14.sql
}

control "iam_8" {
  title         = "8 Unused IAM user credentials should be removed"
  description   = "This control checks whether your IAM users have passwords or active access keys that have not been used for 90 days."
  severity      = "medium"
  sql           = aws_compliance.query.iam_user_unused_credentials_90.sql
}

control "iam_21" {
  title         = "21 IAM customer managed policies that you create should not allow wildcard actions for services"
  description   = "This control checks whether the IAM identity-based policies that you create have Allow statements that use the * wildcard to grant permissions for all actions on any service. The control fails if any policy statement includes 'Effect': 'Allow' with 'Action': 'Service:*'."
  severity      = "low"
  sql           = aws_compliance.query.iam_policy_custom_no_service_wildcard.sql
}

control "iam_cis_v200_1_9" {
  title         = "1.9 Ensure IAM password policy prevents password reuse"
  description   = "IAM password policies can prevent the reuse of a given password by the same user. It is recommended that the password policy prevent the reuse of passwords."
  sql           = aws_compliance.query.iam_account_password_policy_reuse_24.sql
}

control "iam_cis_v200_1_12" {
  title         = "1.12 Ensure credentials unused for 45 days or greater are disabled"
  description   = "AWS IAM users can access AWS resources using different types of credentials, such as passwords or access keys. It is recommended that all credentials that have been unused in 45 or greater days be deactivated or removed."
  sql           = aws_compliance.query.iam_user_unused_credentials_45.sql
}

control "iam_cis_v200_1_13" {
  title         = "1.13 Ensure there is only one active access key available for any single IAM user"
  description   = "Access keys are long-term credentials for an IAM user or the AWS account root user. You can use access keys to sign programmatic requests to the AWS CLI or AWS API (directly or using the AWS SDK)."
  sql           = aws_compliance.query.iam_user_one_active_key.sql
}

control "iam_cis_v200_1_14" {
  title         = "1.14 Ensure access keys are rotated every 90 days or less"
  description   = "Access keys consist of an access key ID and secret access key, which are used to sign programmatic requests that you make to AWS. AWS users need their own access keys to make programmatic calls to AWS from the AWS Command Line Interface (AWS CLI), Tools for Windows PowerShell, the AWS SDKs, or direct HTTP calls using the APIs for individual AWS services. It is recommended that all access keys be regularly rotated."
  sql           = aws_compliance.query.iam_user_access_key_age_90.sql
}

control "iam_cis_v200_1_15" {
  title         = "1.15 Ensure IAM Users Receive Permissions Only Through Groups"
  description   = "IAM users are granted access to services, functions, and data through IAM policies. There are three ways to define policies for a user: 1) Edit the user policy directly, aka an inline, or user, policy; 2) attach a policy directly to a user; 3) add the user to an IAM group that has an attached policy. Only the third implementation is recommended."
  sql           = aws_compliance.query.iam_user_no_inline_attached_policies.sql
}

control "iam_cis_v200_1_17" {
  title         = "1.17 Ensure a support role has been created to manage incidents with AWS Support"
  description   = "AWS provides a support center that can be used for incident notification and response, as well as technical support and customer services. Create an IAM Role to allow authorized users to manage incidents with AWS Support."
  sql           = aws_compliance.query.iam_support_role.sql
}

control "iam_cis_v200_1_18" {
  title         = "1.18 Ensure IAM instance roles are used for AWS resource access from instances"
  description   = "AWS access from within AWS instances can be done by either encoding AWS keys into AWS API calls or by assigning the instance to a role which has an appropriate permissions policy for the required access. \"AWS Access\" means accessing the APIs of AWS in order to access AWS resources or manage AWS account resources."
  sql           = aws_compliance.query.manual_control.sql
}

control "iam_cis_v200_1_19" {
  title         = "1.19 Ensure that all the expired SSL/TLS certificates stored in AWS IAM are removed"
  description   = "To enable HTTPS connections to your website or application in AWS, you need an SSL/TLS server certificate. You can use ACM or IAM to store and deploy server certificates. Use IAM as a certificate manager only when you must support HTTPS connections in a region that is not supported by ACM. IAM securely encrypts your private keys and stores the encrypted version in IAM SSL certificate storage. IAM supports deploying server certificates in all regions, but you must obtain your certificate from an external provider for use with AWS. You cannot upload an ACM certificate to IAM. Additionally, you cannot manage your certificates from the IAM Console."
  sql           = aws_compliance.query.iam_server_certificate_not_expired.sql
}

control "iam_cis_v200_1_20" {
  title         = "1.20 Ensure that IAM Access analyzer is enabled for all regions"
  description   = "Enable IAM Access analyzer for IAM policies about all resources in each region. IAM Access Analyzer is a technology introduced at AWS reinvent 2019. After the Analyzer is enabled in IAM, scan results are displayed on the console showing the accessible resources. Scans show resources that other accounts and federated users can access, such as KMS keys and IAM roles. So the results allow you to determine if an unintended user is allowed, making it easier for administrators to monitor least privileges access. Access Analyzer analyzes only policies that are applied to resources in the same AWS Region."
  sql           = aws_compliance.query.iam_access_analyzer_enabled.sql
}