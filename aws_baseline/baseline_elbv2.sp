benchmark "aws_baseline_elbv2" {
  title         = "ELBv2"
  children = [
    control.elbv2_1
  ]
}

control "elbv2_1" {
  title         = "1 Application Load Balancer should be configured to redirect all HTTP requests to HTTPS"
  description   = "This control checks whether HTTP to HTTPS redirection is configured on all HTTP listeners of Application Load Balancers. The check fails if one or more HTTP listeners of Application Load Balancers do not have HTTP to HTTPS redirection configured."
  severity      = "medium"
  sql         = aws_compliance.query.elb_application_lb_redirect_http_request_to_https.sql
}
