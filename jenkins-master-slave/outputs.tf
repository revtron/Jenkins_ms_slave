output "jenkins_master_public_ip" {
  value = aws_instance.jenkins_master.public_ip
}

output "jenkins_slave_ips" {
  value = [for instance in aws_instance.jenkins_slave : instance.public_ip]
}
