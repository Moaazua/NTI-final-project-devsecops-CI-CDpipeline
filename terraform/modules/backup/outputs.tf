output "vault_arn" {
  value = try(aws_backup_vault.this[0].arn, "")
  description = "ARN of the backup vault"
}

output "plan_id" {
  value = try(aws_backup_plan.daily[0].id, "")
  description = "ID of the backup plan"
}
