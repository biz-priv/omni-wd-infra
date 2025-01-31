resource "aws_ssm_parameter" "shipment_milestone_queue_arn" {
  name  = "/${var.application}/${var.env}/shipment-file-queue-arn"
  type  = "String"
  value = aws_sqs_queue.omni_wd_infra_shipment_milestone_stream_queue.arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_wd_milestone_update_status_table_name" {
  name  = "/${var.application}/${var.env}/milestone-update-status-table-name"
  type  = "String"
  value = aws_dynamodb_table.omni_wd_milestone_update_status_table.name
  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_wd_milestone_update_status_table_table_stream_arn" {
  name  = "/${var.application}/${var.env}/milestone-update-status-table-stream-arn"
  type  = "String"
  value = aws_dynamodb_table.omni_wd_milestone_update_status_table.stream_arn
  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_wd_milestone_update_status_table_table_status_index" {
  name  = "/${var.application}/${var.env}/milestone-update-status-table-status-index"
  type  = "String"
  value = "Status-index"
  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_wd_bill_to" {
  name  = "/${var.application}/${var.env}/wd-bill-to"
  type  = "String"
  value = var.bill_to
  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}
