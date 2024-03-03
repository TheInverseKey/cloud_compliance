benchmark "aws_baseline_dynamodb" {
  title         = "DynamoDB"
  children = [
    control.dynamodb_1,
    control.dynamodb_2,
    control.dynamodb_3
  ]
}

control "dynamodb_1" {
  title         = "1 DynamoDB tables should automatically scale capacity with demand"
  description   = "This control checks whether an Amazon DynamoDB table can scale its read and write capacity as needed. This control passes if the table uses either on-demand capacity mode or provisioned mode with auto scaling configured. Scaling capacity with demand avoids throttling exceptions, which helps to maintain availability of your applications."
  severity      = "medium"
  sql           = aws_compliance.query.dynamodb_table_auto_scaling_enabled
}

control "dynamodb_2" {
  title         = "2 DynamoDB tables should have point-in-time recovery enabled"
  description   = "This control checks whether point-in-time recovery (PITR) is enabled for an Amazon DynamoDB table. Backups help you to recover more quickly from a security incident. They also strengthen the resilience of your systems. DynamoDB point-in-time recovery automates backups for DynamoDB tables. It reduces the time to recover from accidental delete or write operations. DynamoDB tables that have PITR enabled can be restored to any point in time in the last 35 days."
  severity      = "medium"
  sql           = aws_compliance.query.dynamodb_table_point_in_time_recovery_enabled
}

control "dynamodb_3" {
  title         = "3 DynamoDB Accelerator (DAX) clusters should be encrypted at rest"
  description   = "This control checks whether a DAX cluster is encrypted at rest. Encrypting data at rest reduces the risk of data stored on disk being accessed by a user not authenticated to AWS. The encryption adds another set of access controls to limit the ability of unauthorized users to access to the data. For example, API permissions are required to decrypt the data before it can be read."
  severity      = "medium"
  sql           = aws_compliance.query.dax_cluster_encryption_at_rest_enabled
}