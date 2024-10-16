mod "cloud_compliance" {
  # hub metadata
  title         = "Cloud Benchmarks"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, FFIEC, PCI, NIST, HIPAA, RBI CSF, GDPR, SOC 2, Audit Manager Control Tower, FedRAMP, GxP and AWS Foundational Security Best Practices controls across all your AWS accounts using Steampipe."
  color         = "#FF9900"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/aws-compliance.svg"
  categories    = ["aws", "cis", "compliance", "pci dss", "public cloud", "security"]

  require {
    plugin "aws" {
      min_version = "0.133.0"
    }
    mod "github.com/turbot/steampipe-mod-aws-compliance" {
      version = "latest"
    }
	mod "github.com/turbot/steampipe-mod-aws-insights" {
      version = "latest"
    }
	 plugin "azure" {
      min_version = "0.54.0"
    }
    plugin "azuread" {
      min_version = "0.15.0"
    }
	mod "github.com/turbot/steampipe-mod-azure-compliance" {
      version = "latest"
    }
	mod "github.com/turbot/steampipe-mod-azure-insights" {
      version = "latest"
    }
    plugin "gcp" {
      min_version = "0.49.0"
    }
    mod "github.com/turbot/steampipe-mod-gcp-compliance" {
      version = "latest"
	}
	mod "github.com/turbot/steampipe-mod-gcp-insights" {
      version = "latest"
    }
  }
}
