# output "cluster_summary" {
#   description = "Cluster Summary."
#   value = {
#     #cluster_version : local.k3s_version
#     cluster_region : var.region
#     cluster_id : digitalocean_kubernetes_cluster.doks.id
#     host_endpoint : digitalocean_kubernetes_cluster.doks.endpoint
#     cluster_token : digitalocean_kubernetes_cluster.doks.kube_config[0].token
#     cluster_ca_certificate : base64decode(
#       digitalocean_kubernetes_cluster.doks.kube_config[0].cluster_ca_certificate
#     )
#   }
#   sensitive = true
# }

output "cluster_id" {
  value = digitalocean_kubernetes_cluster.doks.id
}

output "cluster_subnet" {
  value = digitalocean_kubernetes_cluster.doks.cluster_subnet
}

output "service_subnet" {
  value = digitalocean_kubernetes_cluster.doks.service_subnet
}

output "endpoint" {
  value = digitalocean_kubernetes_cluster.doks.endpoint
}

output "ca_cert" {
  value = base64decode(
    digitalocean_kubernetes_cluster.doks.kube_config[0].cluster_ca_certificate
  )
  sensitive = true
}

output "cluster_token" {
  value     = digitalocean_kubernetes_cluster.doks.kube_config[0].token
  sensitive = true
}