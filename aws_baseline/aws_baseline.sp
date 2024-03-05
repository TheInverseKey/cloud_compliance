benchmark "aws_baseline" {
  title         = "AWS Baseline"
  description   = "AWS Baseline"
  
  children = [
    benchmark.aws_baseline_account,
    benchmark.aws_baseline_acm,
    benchmark.aws_baseline_apigateway,
    benchmark.aws_baseline_autoscaling,
    benchmark.aws_baseline_cloudformation,
    benchmark.aws_baseline_cloudfront,
    benchmark.aws_baseline_cloudtrail,
    benchmark.aws_baseline_cloudwatch,
    benchmark.aws_baseline_codebuild,
    benchmark.aws_baseline_config,
    benchmark.aws_baseline_dms,
    benchmark.aws_baseline_dynamodb,
    benchmark.aws_baseline_ec2,
    benchmark.aws_baseline_ecr,
    benchmark.aws_baseline_ecs,
    benchmark.aws_baseline_efs,
    benchmark.aws_baseline_eks,
    benchmark.aws_baseline_elasticache,
    benchmark.aws_baseline_elasticbeanstalk
  ]
}