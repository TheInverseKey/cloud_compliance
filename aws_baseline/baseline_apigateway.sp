benchmark_aws_apigateway" {
  title         = "API Gateway"
  children = [
    aws_compliance.control.foundational_security_apigateway_1,
    aws_compliance.control.foundational_security_apigateway_2,
    aws_compliance.control.foundational_security_apigateway_3,
    aws_compliance.control.foundational_security_apigateway_4,
    aws_compliance.control.foundational_security_apigateway_5,
    aws_compliance.control.foundational_security_apigateway_8,
    aws_compliance.control.foundational_security_apigateway_9
  ]
}
