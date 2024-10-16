benchmark "gcp_baseline" {
  title         = "GCP Baseline"
  description   = "GCP Baseline"
  
  children = [
    gcp_compliance.benchmark.cis_
}