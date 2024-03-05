benchmark "aws_baseline_elasticbeanstalk" {
  title         = "Elastic Beanstalk"
  children = [
    control.foundational_security_elasticbeanstalk_1
  ]
}

control "foundational_security_elasticbeanstalk_1" {
  title         = "1 Elastic Beanstalk environments should have enhanced health reporting enabled"
  description   = "This control checks whether enhanced health reporting is enabled for your AWS Elastic Beanstalk environments.Elastic Beanstalk enhanced health reporting enables a more rapid response to changes in the health of the underlying infrastructure. These changes could result in a lack of availability of the application."
  severity      = "low"
  sql           = aws_compliance.query.elastic_beanstalk_enhanced_health_reporting_enabled
}
