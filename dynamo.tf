resource "aws_dynamodb_table" "omni_wd_milestone_update_status_table" {
  name             = "omni-wd-milestone-update-status-${var.env}"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "OrderNo"
  range_key        = "OrderStatus"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "OrderNo"
    type = "S"
  }

  attribute {
    name = "OrderStatus"
    type = "S"
  }

  attribute {
    name = "Status"
    type = "S"
  }

  global_secondary_index {
    name            = "Status-index"
    hash_key        = "Status"
    projection_type = "ALL"
  }

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}
