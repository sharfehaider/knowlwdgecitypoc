resource "aws_db_subnet_group" "main" {
  name       = "${var.name_prefix}-rds-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "${var.name_prefix}-rds-subnet-group"
  }
}

resource "aws_rds_cluster" "main" {
  cluster_identifier      = "${var.name_prefix}-rds-cluster"
  engine                  = var.engine
  engine_version          = var.engine_version
  database_name           = var.db_name
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = 7
  preferred_backup_window = "07:00-09:00"
  availability_zones      = var.availability_zones

  storage_encrypted       = true
  kms_key_id              = var.kms_key_id
}

resource "aws_rds_cluster_instance" "instances" {
  count              = var.instance_count
  identifier         = "${var.name_prefix}-rds-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.main.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.main.engine
  engine_version     = aws_rds_cluster.main.engine_version
  publicly_accessible = false
  #subnet_group_name  = aws_db_subnet_group.main.name

  tags = {
    Name = "${var.name_prefix}-rds-instance-${count.index}"
  }
}


