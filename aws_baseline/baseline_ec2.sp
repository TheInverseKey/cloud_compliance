benchmark "aws_baseline_ec2" {
  title         = "EC2"
  children = [
    control.ec2_1,
    control.ec2_2,
    control.ec2_3,
    control.ec2_4,
    control.ec2_6,
    control.ec2_7,
    control.ec2_8,
    control.ec2_9,
    control.ec2_10,
    control.ec2_15,
    control.ec2_16,
    control.ec2_17,
    control.ec2_18,
    control.ec2_19,
    control.ec2_20,
    control.ec2_21,
    control.ec2_22,
    control.ec2_23,
    control.ec2_24,
    control.ec2_25,
	control.ec2_cis_v200_5_5,
    control.ec2_cis_v200_5_3,
    control.ec2_cis_v200_5_2,
    control.ec2_cis_v200_5_1
  ]
}

control "ec2_1" {
  title         = "1 Amazon EBS snapshots should not be public, determined by the ability to be restorable by anyone"
  description   = "Amazon EBS snapshots should not be public, determined by the ability to be restorable by anyone. EBS snapshots are used to back up the data on your EBS volumes to Amazon S3 at a specific point in time. You can use the snapshots to restore previous states of EBS volumes. It is rarely acceptable to share a snapshot with the public. Typically the decision to share a snapshot publicly was made in error or without a complete understanding of the implications. This check helps ensure that all such sharing was fully planned and intentional."
  severity      = "critical"
  sql           = aws_compliance.query.ebs_snapshot_not_publicly_restorable.sql
}

control "ec2_2" {
  title         = "2 The VPC default security group should not allow inbound and outbound traffic"
  description   = "This control checks that the default security group of a VPC does not allow inbound or outbound traffic. The rules for the default security group allow all outbound and inbound traffic from network interfaces (and their associated instances) that are assigned to the same security group."
  severity      = "high"
  sql           = aws_compliance.query.vpc_default_security_group_restricts_all_traffic.sql
}

control "ec2_3" {
  title         = "3 Attached EBS volumes should be encrypted at rest"
  description   = "This control checks whether the EBS volumes that are in an attached state are encrypted. To pass this check, EBS volumes must be in use and encrypted. If the EBS volume is not attached, then it is not subject to this check."
  severity      = "medium"
  sql           = aws_compliance.query.ebs_attached_volume_encryption_enabled.sql
}

control "ec2_4" {
  title         = "4 Stopped EC2 instances should be removed after a specified time period"
  description   = "This control checks whether any EC2 instances have been stopped for more than the allowed number of days. An EC2 instance fails this check if it is stopped for longer than the maximum allowed time period, which by default is 30 days."
  severity      = "medium"
  sql           = aws_compliance.query.ec2_stopped_instance_30_days.sql
  
}

control "ec2_6" {
  title         = "6 VPC flow logging should be enabled in all VPCs"
  description   = "This control checks whether Amazon VPC Flow Logs are found and enabled for VPCs. The traffic type is set to Reject. With the VPC Flow Logs feature, you can capture information about the IP address traffic going to and from network interfaces in your VPC. After you create a flow log, you can view and retrieve its data in CloudWatch Logs. To reduce cost, you can also send your flow logs to Amazon S3."
  severity      = "medium"
  sql           = aws_compliance.query.vpc_flow_logs_enabled.sql
}

control "ec2_7" {
  title         = "7 EBS default encryption should be enabled"
  description   = "This control checks whether account-level encryption is enabled by default for Amazon Elastic Block Store(Amazon EBS). The control fails if the account level encryption is not enabled."
  severity      = "medium"
  sql           = aws_compliance.query.ec2_ebs_default_encryption_enabled.sql
}

control "ec2_8" {
  title         = "8 EC2 instances should use IMDSv2"
  description   = "This control checks whether your EC2 instance metadata version is configured with Instance Metadata Service Version 2 (IMDSv2). The control passes if HttpTokens is set to required for IMDSv2. The control fails if HttpTokens is set to optional."
  severity      = "high"
  sql           = aws_compliance.query.ec2_instance_uses_imdsv2.sql
}

control "ec2_9" {
  title         = "9 EC2 instances should not have a public IP address"
  description   = "This control checks whether EC2 instances have a public IP address. The control fails if the publicIp field is present in the EC2 instance configuration item. This control applies to IPv4 addresses only."
  severity      = "high"
  sql           = aws_compliance.query.ec2_instance_not_publicly_accessible.sql
}

control "ec2_10" {
  title         = "10 Amazon EC2 should be configured to use VPC endpoints"
  description   = "This control checks whether a service endpoint for Amazon EC2 is created for each VPC. The control fails if a VPC does not have a VPC endpoint created for the Amazon EC2 service."
  severity      = "medium"
  sql           = aws_compliance.query.vpc_configured_to_use_vpc_endpoints.sql
}

control "ec2_15" {
  title         = "15 EC2 subnets should not automatically assign public IP addresses"
  description   = "This control checks whether the assignment of public IPs in Amazon Virtual Private Cloud (Amazon VPC) subnets have MapPublicIpOnLaunch set to FALSE. The control passes if the flag is set to FALSE."
  severity      = "medium"
  sql           = aws_compliance.query.vpc_subnet_auto_assign_public_ip_disabled.sql
}

control "ec2_16" {
  title         = "16 Unused network access control lists should be removed"
  description   = "This control checks whether there are any unused network access control lists (ACLs). The control checks the item configuration of the resource AWS::EC2::NetworkAcl and determines the relationships of the network ACL."
  severity      = "low"
  sql           = aws_compliance.query.vpc_network_acl_unused.sql
}

control "ec2_17" {
  title         = "17 EC2 instances should not use multiple ENIs"
  description   = "This control checks whether an EC2 instance uses multiple Elastic Network Interfaces (ENIs) or Elastic Fabric Adapters (EFAs). This control passes if a single network adapter is used. The control includes an optional parameter list to identify the allowed ENIs."
  severity      = "low"
  sql           = aws_compliance.query.ec2_instance_not_use_multiple_enis.sql
}

control "ec2_18" {
  title         = "18 Security groups should only allow unrestricted incoming traffic for authorized ports"
  description   = "This control checks whether the security groups that are in use allow unrestricted incoming traffic. Optionally the rule checks whether the port numbers are listed in the authorizedTcpPorts parameter. The default values for authorizedTcpPorts are 80 and 443."
  severity      = "high"
  sql           = aws_compliance.query.vpc_security_group_allows_ingress_authorized_ports.sql
}

control "ec2_19" {
  title         = "19 Security groups should not allow unrestricted access to ports with high risk"
  description   = "This control checks whether unrestricted incoming traffic for the security groups is accessible to the specified ports that have the highest risk. This control passes when none of the rules in a security group allow ingress traffic from 0.0.0.0/0 for those ports."
  severity      = "medium"
  sql           = aws_compliance.query.vpc_security_group_restricted_common_ports.sql
}

control "ec2_20" {
  title         = "20 Both VPN tunnels for an AWS Site-to-Site VPN connection should be up"
  description   = "This control checks that both VPN tunnels provided by AWS Site-to-Site VPN are in UP status. The control fails if one or both tunnels are in DOWN status."
  severity      = "medium"
  sql           = aws_compliance.query.vpc_vpn_tunnel_up.sql
}

control "ec2_21" {
  title         = "21 Network ACLs should not allow ingress from 0.0.0.0/0 to port 22 or port 3389"
  description   = "This control checks if default ports for SSH/RDP ingress traffic for network access control lists (NACLs) is unrestricted. The rule fails if a NACL inbound entry allows a source CIDR block of '0.0.0.0/0' or '::/0' for ports 22 or 3389."
  severity      = "medium"
  sql           = aws_compliance.query.vpc_network_acl_remote_administration.sql
}

control "ec2_22" {
  title         = "22 Unused EC2 security groups should be removed"
  description   = "This AWS control checks that security groups are attached to Amazon Elastic Compute Cloud (Amazon EC2) instances or to an elastic network interface. The control will fail if the security group is not associated with an Amazon EC2 instance or an elastic network interface."
  severity      = "medium"
  sql           = aws_compliance.query.vpc_security_group_unused.sql
}

control "ec2_23" {
  title         = "23 EC2 Transit Gateways should not automatically accept VPC attachment requests"
  description   = "This control checks if EC2 Transit Gateways are automatically accepting shared VPC attachments. This control fails for a Transit Gateway that automatically accepts shared VPC attachment requests."
  severity      = "high"
  sql           = aws_compliance.query.ec2_transit_gateway_auto_cross_account_attachment_disabled
}

control "ec2_24" {
  title         = "24 Paravirtual EC2 instance types should not be used"
  description   = "This control checks whether the virtualization type of an EC2 instance is paravirtual. The control fails if the virtualizationType of the EC2 instance is set to paravirtual."
  severity      = "medium"
  sql           = aws_compliance.query.ec2_instance_virtualization_type_no_paravirtual.sql
}

control "ec2_25" {
  title         = "25 Amazon EC2 launch templates should not assign public IPs to network interfaces"
  description   = "This control checks if Amazon EC2 launch templates are configured to assign public IP addresses to network interfaces upon launch. The control fails if an EC2 launch template is configured to assign a public IP address to network interfaces or if there is at least one network interface that has a public IP address."
  severity      = "high"
  sql           = aws_compliance.query.ec2_launch_template_not_publicly_accessible.sql
}

control "ec2_cis_v200_5_1" {
  title         = "5.1 Ensure no Network ACLs allow ingress from 0.0.0.0/0 to remote server administration ports"
  description   = "The Network Access Control List (NACL) function provide stateless filtering of ingress and egress network traffic to AWS resources. It is recommended that no NACL allows unrestricted ingress access to remote server administration ports, such as SSH to port 22 and RDP to port 3389, using either the TCP (6), UDP (17) or ALL (-1) protocols."
  severity      = "high"
  sql           = aws_compliance.query.vpc_network_acl_remote_administration.sql
}

control "ec2_cis_v200_5_2" {
  title         = "5.2 Ensure no security groups allow ingress from 0.0.0.0/0 to remote server administration ports"
  description   = "Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH to port 22 and RDP to port 3389, using either the TCP (6), UDP (17) or ALL (-1) protocols."
  severity      = "high"
  sql           = aws_compliance.query.vpc_security_group_remote_administration_ipv4.sql
}

control "ec2_cis_v200_5_3" {
  title         = "5.3 Ensure no security groups allow ingress from ::/0 to remote server administration ports"
  description   = "Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH to port 22 and RDP to port 3389."
  severity      = "high"
  sql           = aws_compliance.query.vpc_security_group_remote_administration_ipv6.sql
}

control "ec2_cis_v200_5_4" {
  title         = "5.4 Ensure the default security group of every VPC restricts all traffic"
  description   = "A VPC comes with a default security group whose initial settings deny all inbound traffic, allow all outbound traffic, and allow all traffic between instances assigned to the security group. If you don't specify a security group when you launch an instance, the instance is automatically assigned to this default security group. Security groups provide stateful filtering of ingress/egress network traffic to AWS resources. It is recommended that the default security group restrict all traffic."
  severity      = "high"
  sql           = aws_compliance.query.vpc_default_security_group_restricts_all_traffic.sql
}

control "ec2_cis_v200_5_5" {
  title         = "5.5 Ensure routing tables for VPC peering are \"least access\""
  description   = "Once a VPC peering connection is established, routing tables must be updated to establish any connections between the peered VPCs. These routes can be as specific as desired - even peering a VPC to only a single host on the other side of the connection."
  severity      = "high"
  sql           = aws_compliance.query.manual_control.sql
}