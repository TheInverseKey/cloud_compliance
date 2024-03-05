benchmark "aws_baseline_account" {
  title         = "Account"
  description = "Account checks"
  children = [
    control.contact_information
  ]
}

control "contact_information" {
  title         = "1 Security contact information should be provided for an AWS account"
  description   = "This control checks if an Amazon Web Services (AWS) account has security contact information. The control fails if security contact information is not provided for the account."
  severity      = "medium"
  sql         = aws_compliance.query.account_alternate_contact_security_registered.sql
  
  
}

  
