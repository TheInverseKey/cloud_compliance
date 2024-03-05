benchmark "aws_baseline_autoscaling" {
  title         = "Auto Scaling"
  children = [
    control.autoscaling_1,
    control.autoscaling_2,
    control.autoscaling_3,
    control.autoscaling_4,
    control.autoscaling_5,
    control.autoscaling_6,
    control.autoscaling_9
  ]
}


control "autoscaling_1" {
  title         = "1 Auto Scaling groups associated with a load balancer should use load balancer health checks"
  description   = "This control checks whether your Auto Scaling groups that are associated with a load balancer are using Elastic Load Balancing health checks. This ensures that the group can determine an instance's health based on additional tests provided by the load balancer. Using Elastic Load Balancing health checks can help support the availability of applications that use EC2 Auto Scaling groups."
  severity      = "low"
  sql           = aws_compliance.query.autoscaling_group_with_lb_use_health_check.sql
}

control "foundational_security_autoscaling_2" {
  title         = "2 Amazon EC2 Auto Scaling group should cover multiple Availability Zones"
  description   = "This control checks whether an Auto Scaling group spans multiple Availability Zones. The control fails if an Auto Scaling group does not span multiple availability zones."
  severity      = "medium"
  query         = aws_compliance.query.autoscaling_group_multiple_az_configured.sql
}

control "foundational_security_autoscaling_3" {
  title         = "3 Auto Scaling group should configure EC2 instances to require Instance Metadata Service Version 2 (IMDSv2)"
  description   = "This control checks whether IMDSv2 is enabled on all instances launched by Amazon EC2 Auto Scaling groups. The control fails if the Instance Metadata Service (IMDS) version is not included in the launch configuration or if both IMDSv1 and IMDSv2 are enabled."
  severity      = "high"
  sql           = aws_compliance.query.autoscaling_launch_config_requires_imdsv2.sql
}

control "foundational_security_autoscaling_4" {
  title         = "4 Auto Scaling group launch configuration should not have metadata response hop limit greater than 1"
  description   = "This control checks the number of network hops that a metadata token can travel. The control fails if the metadata response hop limit is greater than 1."
  severity      = "high"
  sql           = aws_compliance.query.autoscaling_launch_config_hop_limit.sql
}

control "foundational_security_autoscaling_5" {
  title         = "5 Amazon EC2 instances launched using Auto Scaling group launch configurations should not have Public IP addresses"
  description   = "This control checks whether an Auto Scaling groups associated launch configuration assigns a public IP address to the group's instances."
  severity      = "high"
  sql           = aws_compliance.query.autoscaling_launch_config_public_ip_disabled.sql
}

control "foundational_security_autoscaling_6" {
  title         = "6 Auto Scaling groups should use multiple instance types in multiple Availability Zones"
  description   = "This control checks whether an Amazon EC2 Auto Scaling group uses multiple instance types. The control fails if the Auto Scaling group has only one instance type defined."
  severity      = "medium"
  sql           = aws_compliance.query.autoscaling_use_multiple_instance_types_in_multiple_az.sql
}

control "foundational_security_autoscaling_9" {
  title         = "9 EC2 Auto Scaling groups should use EC2 launch templates"
  description   = "This control checks whether an Amazon EC2 Auto Scaling group is created from an EC2 launch template. This control fails if an Amazon EC2 Auto Scaling group is not created with a launch template or if a launch template is not specified in a mixed instances policy."
  severity      = "medium"
  sql           = aws_compliance.query.autoscaling_group_uses_ec2_launch_template.sql
}
