output "jenkinsvm_ip" {
  value = module.JenkinsVM.public_ip
}

output "testvm_ip" {
  value = module.TestVM.public_ip
}

output "rds_endpoint_prod" {
  value = module.prod_rds.rds_endpoint
}