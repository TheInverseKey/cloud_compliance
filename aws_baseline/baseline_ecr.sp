benchmark "aws_baseline_ecr" {
  title         = "Elastic Container Registry"
  children = [
    control.ecr_1,
    control.ecr_2,
    control.ecr_3
  ]
}

control "ecr_1" {
  title         = "1 ECR private repositories should have image scanning configured"
  description   = "This control checks whether a private ECR repository has image scanning configured. This control fails if a private ECR repository doesn't have image scanning configured."
  severity      = "high"
  query         = aws_compliance.query.ecr_repository_image_scan_on_push_enabled.sql
}

control "ecr_2" {
  title         = "2 ECR private repositories should have tag immutability configured"
  description   = "This control checks whether a private ECR repository has tag immutability enabled. This control fails if a private ECR repository has tag immutability disabled. This rule passes if tag immutability is enabled and has the value IMMUTABLE."
  severity      = "medium"
  query         = aws_compliance.query.ecr_repository_tag_immutability_enabled.sql
}

control "ecr_3" {
  title         = "3 ECR repositories should have at least one lifecycle policy configured"
  description   = "This control checks whether an Amazon ECR repository has at least one lifecycle policy configured. This control fails if an ECR repository does not have any lifecycle policies configured."
  severity      = "medium"
  query         = aws_compliance.query.ecr_repository_lifecycle_policy_configured.sql
}
