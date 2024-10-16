benchmark "gcp_baseline" {
  title         = "Azure Baseline"
  description   = "Azure Baseline"
  
  children = [
    azure_compliance.benchmark.cis_v210
	]
}