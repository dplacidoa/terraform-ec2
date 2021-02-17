output "instance_ippaddr" {
  value       = aws_instance.jboss.private_ip
  description = "print private ip for the instance"
}

output "instance_id" {
  value       = aws_instance.jboss.id
  description = "print id for the instance"
}