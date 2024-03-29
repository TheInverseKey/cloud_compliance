benchmark "aws_baseline_emr" {
  title         = "EMR"
  children = [
    control.foundational_security_emr_1
  ]
}

control "foundational_security_emr_1" {
  title         = "1 Amazon EMR cluster master nodes should not have public IP addresses"
  description   = "This control checks whether master nodes on Amazon EMR clusters have public IP addresses. The control fails if the master node has public IP addresses that are associated with any of its instances. Public IP addresses are designated in the PublicIp field of the NetworkInterfaces configuration for the instance. This control only checks Amazon EMR clusters that are in a RUNNING or WAITING state."
  severity      = "high"
  sql           = aws_compliance.query.emr_cluster_master_nodes_no_public_ip.sql
}
