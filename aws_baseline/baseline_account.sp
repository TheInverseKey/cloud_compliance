benchmark "baseline_aws_account" {
  title         = "Account"
  description = "Account checks"
  children = [
    aws_compliance.control.foundational_security_account_1
  ]
}

