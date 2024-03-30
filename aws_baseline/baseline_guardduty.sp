benchmark "aws_baseline_guardduty" {
  title         = "GuardDuty"
  children = [
    control.guardduty_1
  ]
}

control "guardduty_1" {
  title         = "1 GuardDuty should be enabled"
  description   = "This control checks whether Amazon GuardDuty is enabled in your GuardDuty account and Region. It is highly recommended that you enable GuardDuty in all supported AWS Regions. Doing so allows GuardDuty to generate findings about unauthorized or unusual activity, even in Regions that you do not actively use. This also allows GuardDuty to monitor CloudTrail events for global AWS services such as IAM."
  severity      = "high"
  sql           = aws_compliance.query.guardduty_enabled.sql
}
