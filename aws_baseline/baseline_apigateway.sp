benchmark "aws_baseline_apigateway" {
  title         = "API Gateway"
  children = [
    control.api_gateway_control_1,
    control.api_gateway_control_2,
    control.api_gateway_control_3,
    control.api_gateway_control_4,
    control.api_gateway_control_5,
    control.api_gateway_control_8,
    control.api_gateway_control_9
  ]
}


control "api_gateway_control_1" {
  title         = "1 API Gateway REST and WebSocket API logging should be enabled"
  description   = "This control checks whether all stages of an Amazon API Gateway REST or WebSocket API have logging enabled. The control fails if logging is not enabled for all methods of a stage or if loggingLevel is neither ERROR nor INFO."
  severity      = "medium"
  sql           = aws_compliance.query.apigateway_stage_logging_enabled.sql
}

control "api_gateway_control_2" {
  title         = "2 API Gateway REST API stages should be configured to use SSL certificates for backend authentication"
  description   = "This control checks whether Amazon API Gateway REST API stages have SSL certificates configured. Backend systems use these certificates to authenticate that incoming requests are from API Gateway."
  severity      = "medium"
  sql           = aws_compliance.query.apigateway_rest_api_stage_use_ssl_certificate.sql
}

control "api_gateway_control_3" {
  title         = "3 API Gateway REST API stages should have AWS X-Ray tracing enabled"
  description   = "This control checks whether AWS X-Ray active tracing is enabled for your Amazon API Gateway REST API stages."
  severity      = "low"
  sql           = aws_compliance.query.apigateway_rest_api_stage_xray_tracing_enabled.sql
}

control "api_gateway_control_4" {
  title         = "4 API Gateway should be associated with an AWS WAF web ACL"
  description   = "This control checks whether an API Gateway stage uses an AWS WAF web access control list (ACL). This control fails if an AWS WAF web ACL is not attached to a REST API Gateway stage."
  severity      = "medium"
  sql           = aws_compliance.query.apigateway_stage_use_waf_web_acl.sql
}

control "api_gateway_control_5" {
  title         = "5 API Gateway REST API cache data should be encrypted at rest"
  description   = "This control checks whether all methods in API Gateway REST API stages that have cache enabled are encrypted. The control fails if any method in an API Gateway REST API stage is configured to cache and the cache is not encrypted."
  severity      = "medium"
  sql           = aws_compliance.query.apigateway_stage_cache_encryption_at_rest_enabled.sql
}

control "api_gateway_control_8" {
  title         = "8 API Gateway routes should specify an authorization type"
  description   = "This control checks if Amazon API Gateway routes have an authorization type. The control fails if the API Gateway route does not specify an authorization type."
  severity      = "medium"
  sql           = aws_compliance.query.api_gatewayv2_route_authorization_type_configured.sql
}

control "api_gateway_control_9" {
  title         = "9 Access logging should be configured for API Gateway V2 Stages"
  description   = "This control checks if Amazon API Gateway V2 stages have access logging configured. This control fails if access log settings aren't defined."
  severity      = "medium"
  sql           = aws_compliance.query.gatewayv2_stage_access_logging_enabled.sql
}
