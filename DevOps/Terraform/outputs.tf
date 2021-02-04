output "jenkinsvm_ip" {
  value = module.JenkinsVM.public_ip
}

output "testvm_ip" {
  value = module.TestVM.public_ip
}