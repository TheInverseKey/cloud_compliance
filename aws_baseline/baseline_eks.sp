benchmark "aws_baseline_eks" {
  title         = "EKS"
  children = [
    control.eks_1,
    control.eks_2
  ]
}

control "eks_1" {
  title         = "1 EKS cluster endpoints should not be publicly accessible"
  description   = "This control checks whether an Amazon EKS cluster endpoint is publicly accessible. The control fails if an EKS cluster has an endpoint that is publicly accessible."
  severity      = "high"
  sql           = aws_compliance.query.eks_cluster_endpoint_restrict_public_access.sql
}

control "eks_2" {
  title         = "2 EKS clusters should run on a supported Kubernetes version"
  description   = "This control checks whether an Amazon EKS cluster is running on a supported Kubernetes version. The control fails if the EKS cluster is running on an unsupported version. If your application doesn't require a specific version of Kubernetes, we recommend that you use the latest available Kubernetes version that's supported by EKS for your clusters."
  severity      = "high"
  sql           = aws_compliance.uery.eks_cluster_with_latest_kubernetes_version.sql
}
