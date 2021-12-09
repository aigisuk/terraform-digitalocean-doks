data "digitalocean_kubernetes_versions" "doks" {
  version_prefix = var.kubernetes_version
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