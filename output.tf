output "network" {
  value = module.network
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "vpc_arn" {
  value = module.network.vpc_arn
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}