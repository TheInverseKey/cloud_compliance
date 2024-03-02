benchmark "aws_baseline_acm" {
  title         = "ACM"
  children = [
    aws_compliance.control.foundational_security_acm_1
  ]
}
