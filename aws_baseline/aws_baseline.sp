benchmark "aws_baseline" {
  title         = "AWS Baseline"
  description   = "AWS Baseline"
  
  children = [
    benchmark.aws_baseline_account,
    benchmark.aws_baseline_acm,
    benchmark.aws_baseline_apigateway,
    benchmark.aws_baseline_autoscaling
  ]
}