benchmark "elb" {
  title         = "ELB"
  children = [
    control.elb_1,
    control.elb_2,
    control.elb_3,
    control.elb_4,
    control.elb_5,
    control.elb_6,
    control.elb_7,
    control.elb_9,
    control.elb_10,
    control.elb_12,
    control.elb_13,
    control.elb_14
  ]
}

control "elb_1" {
  title         = "1 Application Load Balancer should be configured to redirect all HTTP requests to HTTPS"
  description   = "This control checks whether HTTP to HTTPS redirection is configured on all HTTP listeners of Application Load Balancers. The control fails if any of the HTTP listeners of Application Load Balancers do not have HTTP to HTTPS redirection configured."
  severity      = "medium"
  sql           = aws_compliance.query.elb_application_lb_redirect_http_request_to_https.sql
}

control "elb_2" {
  title         = "2 Classic Load Balancers with SSL/HTTPS listeners should use a certificate provided by AWS Certificate Manager"
  description   = "This control checks whether the Classic Load Balancer uses HTTPS/SSL certificates provided by AWS Certificate Manager (ACM). The control fails if the Classic Load Balancer configured with HTTPS/SSL listener does not use a certificate provided by ACM."
  severity      = "medium"
  sql           = aws_compliance.query.elb_classic_lb_use_ssl_certificate.sql
}

control "elb_3" {
  title         = "3 Classic Load Balancer listeners should be configured with HTTPS or TLS termination"
  description   = "This control checks whether your Classic Load Balancer listeners are configured with HTTPS or TLS protocol for front-end (client to load balancer) connections. The control is applicable if a Classic Load Balancer has listeners. If your Classic Load Balancer does not have a listener configured, then the control does not report any findings. The control passes if the Classic Load Balancer listeners are configured with TLS or HTTPS for front-end connections. The control fails if the listener is not configured with TLS or HTTPS for front-end connections."
  severity      = "medium"
  sql           = aws_compliance.query.elb_classic_lb_use_tls_https_listeners.sql
}

control "elb_4" {
  title         = "4 Application load balancers should be configured to drop HTTP headers"
  description   = "This control evaluates AWS Application Load Balancers (ALB) to ensure they are configured to drop invalid HTTP headers. The control fails if the value of routing.http.drop_invalid_header_fields.enabled is set to false. By default, ALBs are not configured to drop invalid HTTP header values. Removing these header values prevents HTTP desync attacks."
  severity      = "medium"
  sql           = aws_compliance.query.elb_application_lb_drop_http_headers.sql
}

control "elb_5" {
  title         = "5 Application and Classic Load Balancers logging should be enabled"
  description   = "This control checks whether the Application Load Balancer and the Classic Load Balancer have logging enabled. The control fails if access_logs.s3.enabled is false."
  severity      = "medium"
  sql           = aws_compliance.query.elb_application_classic_lb_logging_enabled.sql
}

control "elb_6" {
  title         = "6 Application Load Balancer deletion protection should be enabled"
  description   = "This control checks whether an Application Load Balancer has deletion protection enabled. The control fails if deletion protection is not configured. Enable deletion protection to protect your Application Load Balancer from deletion."
  severity      = "medium"
  sql           = aws_compliance.query.elb_application_lb_deletion_protection_enabled.sql
}

control "elb_7" {
  title         = "7 Classic Load Balancers should have connection draining enabled"
  description   = "This control checks whether Classic Load Balancers have connection draining enabled."
  severity      = "medium"
  sql           = aws_compliance.query.ec2_classic_lb_connection_draining_enabled.sql
}

control "elb_9" {
  title         = "9 Classic Load Balancers should have cross-zone load balancing enabled"
  description   = "This control checks if cross-zone load balancing is enabled for the Classic Load Balancers (CLBs). This control fails if cross-zone load balancing is not enabled for a CLB."
  severity      = "medium"
  sql           = aws_compliance.query.elb_classic_lb_cross_zone_load_balancing_enabled.sql
}

control "elb_10" {
  title         = "10 Classic Load Balancers should span multiple Availability Zones"
  description   = "This control checks whether a Classic Load Balancer has been configured to span multiple Availability Zones. The control fails if the Classic Load Balancer does not span multiple Availability Zones."
  severity      = "medium"
  sql           = aws_compliance.query.elb_classic_lb_multiple_az_configured.sql
}

control "elb_12" {
  title         = "12 Application Load Balancers should be configured with defensive or strictest desync mitigation mode"
  description   = "This control checks whether an Application Load Balancer is configured with defensive or strictest desync mitigation mode. The control fails if an Application Load Balancer is not configured with defensive or strictest desync mitigation mode."
  severity      = "medium"
  sql           = aws_compliance.query.elb_application_lb_desync_mitigation_mode.sql
}

control "elb_13" {
  title         = "13 Application, Network, and Gateway Load Balancers should span multiple Availability Zones"
  description   = "This control checks whether an Elastic Load Balancer V2 (Application, Network, or Gateway Load Balancer) has registered instances from multiple Availability Zones. The control fails if an Elastic Load Balancer V2 has instances registered in fewer than two Availability Zones."
  severity      = "medium"
  sql           = aws_compliance.query.elb_application_gateway_network_lb_multiple_az_configured.sql
}

control "elb_14" {
  title         = "14 Classic Load Balancers should be configured with defensive or strictest desync mitigation mode"
  description   = "This control checks whether a Classic Load Balancer is configured with defensive or strictest desync mitigation mode. This control will fail if the Classic Load Balancer is not configured with defensive or strictest desync mitigation mode."
  severity      = "medium"
  sql           = aws_compliance.query.elb_classic_lb_desync_mitigation_mode.sql
}
