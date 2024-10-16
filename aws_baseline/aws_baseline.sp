benchmark "aws_baseline" {
  title         = "AWS Baseline"
  description   = "AWS Baseline"
  
  children = [
    aws_compliance.benchmark.cis_v300,
	aws_compliance.benchmark.cis_compute_service_v100,
	aws_compliance.benchmark.foundational_security
  ]
}