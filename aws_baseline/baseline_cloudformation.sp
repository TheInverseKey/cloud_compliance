benchmark "aws_baseline_cloudformation" {
  title         = "CloudFormation"
  children = [
    aws_compliance.control.foundational_security_cloudformation_1
  ]
}