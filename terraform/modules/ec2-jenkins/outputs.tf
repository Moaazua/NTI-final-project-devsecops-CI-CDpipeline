# -----------------------
# Outputs
# -----------------------
output "instance_arn" {
  value       = aws_instance.jenkins.arn
  description = "ARN of the Jenkins EC2 instance"
}

output "public_ip" {
  value       = aws_instance.jenkins.public_ip
  description = "Public IP of the Jenkins EC2 instance"
}
