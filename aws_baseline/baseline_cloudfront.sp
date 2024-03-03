benchmark "foundational_security_cloudfront" {
  title         = "CloudFront"
  children = [
    control.cloudfront_1,
    control.cloudfront_2,
    control.cloudfront_3,
    control.cloudfront_4,
    control.cloudfront_5,
    control.cloudfront_6,
    control.cloudfront_7,
    control.cloudfront_8,
    control.cloudfront_9,
    control.cloudfront_10,
    control.cloudfront_12
  ]
}

control "cloudfront_1" {
  title         = "1 CloudFront distributions should have a default root object configured"
  description   = "This control checks whether an Amazon CloudFront distribution is configured to return a specific object that is the default root object. The control fails if the CloudFront distribution does not have a default root object configured."
  severity      = "critical"
  sql           = aws_compliance.query.cloudfront_distribution_default_root_object_configured
}

control "cloudfront_2" {
  title         = "2 CloudFront distributions should have origin access identity enabled"
  description   = "This control checks whether an Amazon CloudFront distribution with Amazon S3 Origin type has Origin Access Identity (OAI) configured. The control fails if OAI is not configured."
  severity      = "medium"
  sql           = aws_compliance.query.cloudfront_distribution_origin_access_identity_enabled
}

control "cloudfront_3" {
  title         = "3 CloudFront distributions should require encryption in transit"
  description   = "This control checks whether an Amazon CloudFront distribution requires viewers to use HTTPS directly or whether it uses redirection. The control fails if ViewerProtocolPolicy is set to allow-all for defaultCacheBehavior or for cacheBehaviors."
  severity      = "medium"
  sql           = aws_compliance.query.cloudfront_distribution_encryption_in_transit_enabled
}

control "cloudfront_4" {
  title         = "4 CloudFront distributions should have origin failover configured"
  description   = "This control checks whether an Amazon CloudFront distribution is configured with an origin group that has two or more origins. CloudFront origin failover can increase availability. Origin failover automatically redirects traffic to a secondary origin if the primary origin is unavailable or if it returns specific HTTP response status codes."
  severity      = "low"
  sql           = aws_compliance.query.cloudfront_distribution_configured_with_origin_failover
}

control "cloudfront_5" {
  title         = "5 CloudFront distributions should have logging enabled"
  description   = "This control checks whether server access logging is enabled on CloudFront distributions. The control fails if access logging is not enabled for a distribution."
  severity      = "medium"
  sql           = aws_compliance.query.cloudfront_distribution_logging_enabled
}

control "cloudfront_6" {
  title         = "6 CloudFront distributions should have AWS WAF enabled"
  description   = "This control checks whether CloudFront distributions are associated with either AWS WAF or AWS WAFv2 web ACLs. The control fails if the distribution is not associated with a web ACL."
  severity      = "medium"
  sql           = aws_compliance.query.cloudfront_distribution_waf_enabled
}

control "cloudfront_7" {
  title         = "7 CloudFront distributions should use custom SSL/TLS certificates"
  description   = "This control checks whether CloudFront distributions are using the default SSL/TLS certificate CloudFront provides. This control passes if the CloudFront distribution uses a custom SSL/TLS certificate. This control fails if the CloudFront distribution uses the default SSL/TLS certificate."
  severity      = "medium"
  sql           = aws_compliance.query.cloudfront_distribution_use_custom_ssl_certificate
}

control "cloudfront_8" {
  title         = "8 CloudFront distributions should use SNI to serve HTTPS requests"
  description   = "This control checks if Amazon CloudFront distributions are using a custom SSL/TLS certificate and are configured to use SNI to serve HTTPS requests. This control fails if a custom SSL/TLS certificate is associated but the SSL/TLS support method is a dedicated IP address."
  severity      = "low"
  sql           = aws_compliance.query.cloudfront_distribution_sni_enabled
}

control "cloudfront_9" {
  title         = "9 CloudFront distributions should encrypt traffic to custom origins"
  description   = "This control checks if Amazon CloudFront distributions are encrypting traffic to custom origins. This control fails for a CloudFront distribution whose origin protocol policy allows 'http-only'. This control also fails if the distribution's origin protocol policy is 'match-viewer' while the viewer protocol policy is 'allow-all'."
  severity      = "medium"
  sql           = aws_compliance.query.cloudfront_distribution_custom_origins_encryption_in_transit_enabled
}

control "cloudfront_10" {
  title         = "10 CloudFront distributions should not use deprecated SSL protocols between edge locations and custom origins"
  description   = "This control checks if Amazon CloudFront distributions are using deprecated SSL protocols for HTTPS communication between CloudFront edge locations and your custom origins. This control fails if a CloudFront distribution has a CustomOriginConfig where OriginSslProtocols includes SSLv3."
  severity      = "medium"
  sql           = aws_compliance.query.cloudfront_distribution_no_deprecated_ssl_protocol
}

control "cloudfront_12" {
  title         = "12 CloudFront distributions should not point to non-existent S3 origins"
  description   = "This control checks whether Amazon CloudFront distributions are pointing to non-existent Amazon S3 origins. The control fails for a CloudFront distribution if the origin is configured to point to a non-existent bucket. This control only applies to CloudFront distributions where an S3 bucket without static website hosting is the S3 origin."
  severity      = "high"
  sql           = aws_compliance.query.cloudfront_distribution_no_non_existent_s3_origin
}
