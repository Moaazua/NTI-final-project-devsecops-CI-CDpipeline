resource "random_password" "rds" {
  length  = 16
  special = true
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.db_identifier}-subnet-group"
  subnet_ids = var.db_subnet_ids
  tags       = merge(var.tags, { Name = "${var.db_identifier}-subnet-group" })
}

resource "aws_secretsmanager_secret" "rds_creds" {
  name = "${var.db_identifier}-creds"
}

resource "aws_secretsmanager_secret_version" "rds_creds_ver" {
  secret_id     = aws_secretsmanager_secret.rds_creds.id
  secret_string = jsonencode({
    username = var.username
    password = random_password.rds.result
  })
}

resource "aws_db_instance" "this" {
  identifier              = var.db_identifier
  allocated_storage       = var.allocated_storage
  engine                  = var.engine
  instance_class          = var.instance_class
  username                = var.username
  password                = random_password.rds.result
  db_subnet_group_name    = aws_db_subnet_group.this.name
  skip_final_snapshot     = true
  publicly_accessible     = false
  vpc_security_group_ids  = var.rds_sg_id != "" ? [var.rds_sg_id] : []
  tags                    = merge(var.tags, { Name = var.db_identifier })
}

