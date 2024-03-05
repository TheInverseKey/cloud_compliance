benchmark "aws_baseline_efs" {
  title         = "EFS"
  children = [
    control.efs_1,
    control.efs_2,
    control.efs_3,
    control.efs_4,
    control.efs_cis_v200_2_4_1
  ]
}

control "efs_1" {
  title         = "1 Amazon EFS should be configured to encrypt file data at rest using AWS KMS"
  description   = "This control checks whether Amazon Elastic File System is configured to encrypt the file data using AWS KMS."
  severity      = "medium"
  sql           = aws_compliance.query.efs_file_system_encrypt_data_at_rest.sql
}

control "efs_2" {
  title         = "2 Amazon EFS volumes should be in backup plans"
  description   = "This control checks whether Amazon Elastic File System (Amazon EFS) file systems are added to the backup plans in AWS Backup. The control fails if Amazon EFS file systems are not included in the backup plans."
  severity      = "medium"
  sql           = aws_compliance.query.efs_file_system_automatic_backups_enabled.sql
}

control "efs_3" {
  title         = "3 EFS access points should enforce a root directory"
  description   = "This control checks if Amazon EFS access points are configured to enforce a root directory. The control fails if the value of Path is set to / (the default root directory of the file system)."
  severity      = "medium"
  sql           = aws_compliance.query.efs_access_point_enforce_root_directory.sql
}

control "efs_4" {
  title         = "4 EFS access points should enforce a user identity"
  description   = "This control checks whether Amazon EFS access points are configured to enforce a user identity. This control fails if a POSIX user identity is not defined while creating the EFS access point."
  severity      = "medium"
  sql           = aws_compliance.query.efs_access_point_enforce_user_identity.sql
}

control "efs_cis_v200_4_1" {
  title         = "4.1 Ensure unauthorized API calls are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms."
  sql           = aws_compliance.query.log_metric_filter_unauthorized_api.sql
}