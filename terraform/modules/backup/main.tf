# =====================
# AWS Backup Vault
# =====================
resource "aws_backup_vault" "this" {
  count = var.enabled ? 1 : 0
  name  = var.vault_name
  tags  = var.tags
}

# =====================
# Backup Plan
# =====================
resource "aws_backup_plan" "daily" {
  count = var.enabled ? 1 : 0
  name  = "${var.vault_name}-plan"

  rule {
    rule_name         = "daily"
    target_vault_name = aws_backup_vault.this[0].name
    schedule          = "cron(0 2 * * ? *)"
    lifecycle {
      delete_after = var.retention_days
    }
  }
}

# =====================
# IAM Role for Backup
# =====================
resource "aws_iam_role" "backup_role" {
  count = var.enabled ? 1 : 0
  name  = "${var.vault_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = { Service = "backup.amazonaws.com" }
      }
    ]
  })
}

# =====================
# Backup Selection
# =====================
resource "aws_backup_selection" "jenkins" {
  count = var.enabled ? 1 : 0
  name  = "${var.vault_name}-selection"
  plan_id      = aws_backup_plan.daily[0].id
  iam_role_arn = aws_iam_role.backup_role[0].arn

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Backup"
    value = "true"
  }

  resources = var.ec2_resource_arn == "" ? [] : [var.ec2_resource_arn]
}
