data "digitalocean_kubernetes_versions" "doks" {
  version_prefix = var.kubernetes_version
}

data "digitalocean_vpc" "doks" {
  region = var.region # Returns default VPC in specified region
}

data "digitalocean_sizes" "doks" {
  filter {
    key    = "slug"
    values = [var.size]
  }

  filter {
    key    = "regions"
    values = [var.region]
  }

}