benchmark "aws_baseline_elasticache" {
  title         = "ElastiCache"
  children = [
    control.elasticache_1,
    control.elasticache_2,
    control.elasticache_3,
    control.elasticache_4,
    control.elasticache_5,
    control.elasticache_6,
    control.elasticache_7
  ]
}

control "elasticache_1" {
  title         = "1 ElastiCache for Redis clusters should have automatic backups scheduled"
  description   = "This control evaluates if Amazon ElastiCache for Redis clusters have automatic backup scheduled. The control fails if the SnapshotRetentionLimit for the Redis cluster is less than 1."
  severity      = "high"
  sql           = aws_compliance.query.elasticache_redis_cluster_automatic_backup_retention_15_days.sql
}

control "elasticache_2" {
  title         = "2 Minor version upgrades should be automatically applied to ElastiCache for Redis cache clusters"
  description   = "This control evaluates whether ElastiCache for Redis automatically applies minor version upgrades to cache clusters. This control fails if ElastiCache for Redis cache clusters do not have minor version upgrades automatically applied."
  severity      = "high"
  sql           = aws_compliance.query.elasticache_cluster_auto_minor_version_upgrade_enabled.sql
}

control "elasticache_3" {
  title         = "3 ElastiCache for Redis replication groups should have automatic failover enabled"
  description   = "This control checks if ElastiCache for Redis replication groups have automatic failover enabled. This control fails if automatic failover isn't enabled for a Redis replication group."
  severity      = "medium"
  sql           = aws_compliance.query.elasticache_replication_group_auto_failover_enabled.sql
}

control "elasticache_4" {
  title         = "4 ElastiCache for Redis replication groups should be encrypted at rest"
  description   = "This control checks if ElastiCache for Redis replication groups are encrypted at rest. This control fails if an ElastiCache for Redis replication group isn't encrypted at rest."
  severity      = "medium"
  sql           = aws_compliance.query.elasticache_replication_group_encryption_at_rest_enabled.sql
}

control "elasticache_5" {
  title         = "5 ElastiCache for Redis replication groups should be encrypted in transit"
  description   = "This control checks if ElastiCache for Redis replication groups are encrypted in transit. This control fails if an ElastiCache for Redis replication group isn't encrypted in transit."
  severity      = "medium"
  sql           = aws_compliance.query.elasticache_replication_group_encryption_in_transit_enabled.sql
}

control "elasticache_6" {
  title         = "6 ElastiCache for Redis replication groups before version 6.0 should use Redis AUTH"
  description   = "This control checks if ElastiCache for Redis replication groups have Redis AUTH enabled. The control fails for an ElastiCache for Redis replication group if the Redis version of its nodes is below 6.0 and AuthToken isn't in use."
  severity      = "medium"
  sql           = aws_compliance.query.elasticache_replication_group_redis_auth_enabled.sql
}

control "elasticache_7" {
  title         = "7 ElastiCache clusters should not use the default subnet group"
  description   = "This control checks if ElastiCache clusters are configured with a custom subnet group. The control fails for an ElastiCache cluster if CacheSubnetGroupName has the value default."
  severity      = "high"
  sql           = aws_compliance.query.elasticache_cluster_no_default_subnet_group.sql
}
