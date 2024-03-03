benchmark "aws_baseline_cloudformation" {
  title         = "CloudFormation"
  children = [
    control.cloudformation_1
  ]
}


control "cloudformation_1" {
  title         = "1 CloudFormation stacks should be integrated with Simple Notification Service (SNS)"
  description   = "This control checks whether an Amazon Simple Notification Service notification is integrated with a CloudFormation stack. The control fails for a CloudFormation stack if there is no SNS notification associated with it."
  severity      = "low"
  sql         = aws_compliance.query.cloudformation_stack_notifications_enabled
}
