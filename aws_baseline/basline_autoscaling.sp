benchmark "baseline_aws_autoscaling" {
  title         = "Auto Scaling"
  children = [
    aws_compliance.control.foundational_security_autoscaling_1,
    aws_compliance.control.foundational_security_autoscaling_2,
    aws_compliance.control.foundational_security_autoscaling_3,
    aws_compliance.control.foundational_security_autoscaling_4,
    aws_compliance.control.foundational_security_autoscaling_5,
    aws_compliance.control.foundational_security_autoscaling_6,
    aws_compliance.control.foundational_security_autoscaling_9
  ]
}