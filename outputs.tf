// Primary
output "Primary_Consul" {
  value = module.primarycluster.consul_ui
}

output "Primary_Nomad" {
  value = module.primarycluster.nomad_ui
}

output "Primary_Vault" {
  value = module.primarycluster.vault_ui
}

output "Primary_Fabio" {
  value = module.primarycluster.fabio_lb
}

output "Primary_Hashi_UI" {
  value = module.primarycluster.hashi_ui
}

output "Primary_servers_nodes" {
  value = [module.primarycluster.servers]
}

output "Primary_workers_Nodes" {
  value = [module.primarycluster.workers]
}

output "Primary_eks_endpoint" {
  value = [module.primarycluster.eks_endpoint]
}

// Secondary
/*
output "Secondary_Consul" {
  value = module.secondarycluster.consul_ui
}

output "Secondary_Nomad" {
  value = module.secondarycluster.nomad_ui
}

output "Secondary_Vault" {
  value = module.secondarycluster.vault_ui
}

output "Secondary_Fabio" {
  value = module.secondarycluster.fabio_lb
}

output "Secondary_Hashi_UI" {
  value = module.secondarycluster.hashi_ui
}
output "Secondary_servers_nodes" {
  value = [module.secondarycluster.servers]
}
output "Secondary_workers_Nodes" {
  value = [module.secondarycluster.workers]
}
*/

// Tertiary
/*
output "Tertiary_Consul" {
  value = module.tertiarycluster.consul_ui
}
output "Tertiary_Nomad" {
  value = module.tertiarycluster.nomad_ui
}
output "Tertiary_Vault" {
  value = module.tertiarycluster.vault_ui
}
output "Tertiary_Fabio" {
  value = module.tertiarycluster.fabio_lb
}
output "Tertiary_Hashi_UI" {
  value = module.tertiarycluster.hashi_ui
}
output "Tertiary_server_nodes" {
  value = [module.tertiarycluster.servers]
}
output "Tertiary_workers_Nodes" {
  value = [module.tertiarycluster.workers]
}
*/
