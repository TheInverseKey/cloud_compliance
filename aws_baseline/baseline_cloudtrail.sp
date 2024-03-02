benchmark "aws_baseline_cloudtrail" {
  title         = "CloudTrail"
  children = [
    aws_compliance.control.cis_v200_3_1,
    aws_compliance.control.foundational_security_cloudtrail_1,
    aws_compliance.control.foundational_security_cloudtrail_2,
    aws_compliance.control.foundational_security_cloudtrail_4,
    aws_compliance.control.foundational_security_cloudtrail_5,
    aws_compliance.control.cis_v200_3_3,
    aws_compliance.control.cis_v200_3_6,
    aws_compliance.control.cis_v200_3_7
  ]
}
