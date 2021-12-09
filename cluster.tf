resource "digitalocean_kubernetes_cluster" "doks" {
  name    = var.cluster_name
  region  = var.region
  version = var.kubernetes_version == null ? data.digitalocean_kubernetes_versions.doks.latest_version : var.kubernetes_version

  auto_upgrade = var.auto_upgrade
  tags         = var.tags

  node_pool {
    name       = format("%s-core", var.cluster_name)
    size       = element(data.digitalocean_sizes.doks.sizes, 0).slug
    auto_scale = var.auto_scale
    min_nodes  = var.min_nodes
    max_nodes  = var.max_nodes
    node_count = var.node_count
    tags       = var.node_tags
    labels     = var.node_labels
  }
  maintenance_policy {
    start_time = var.maintenance_policy_start_time
    day        = var.maintenance_policy_day
  }

}