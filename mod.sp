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
      min_version = "0.132.0"
    }
    plugin "azure" {
      min_version = "0.54.0"
    }
    plugin "azuread" {
      min_version = "0.15.0"
    }
    plugin "gcp" {
      min_version = "0.49.0"
    }
    mod "github.com/turbot/steampipe-mod-aws-compliance" {
      version = "*"
    }
    mod "github.com/turbot/steampipe-mod-azure-compliance" {
      version = "*"
    }
    mod "github.com/turbot/steampipe-mod-azure-compliance" {
      version = "*"
    }
  }
}
