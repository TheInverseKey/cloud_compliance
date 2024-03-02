benchmark "aws_baseline_cloudfront" {
  title         = "CloudFront"
  children = [
    aws_compliance.control.foundational_security_cloudfront_1,
    aws_compliance.control.foundational_security_cloudfront_2,
    aws_compliance.control.foundational_security_cloudfront_3,
    aws_compliance.control.foundational_security_cloudfront_4,
    aws_compliance.control.foundational_security_cloudfront_5,
    aws_compliance.control.foundational_security_cloudfront_6,
    aws_compliance.control.foundational_security_cloudfront_7,
    aws_compliance.control.foundational_security_cloudfront_8,
    aws_compliance.control.foundational_security_cloudfront_9,
    aws_compliance.control.foundational_security_cloudfront_10,
    aws_compliance.control.foundational_security_cloudfront_12
  ]
}