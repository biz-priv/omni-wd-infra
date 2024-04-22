resource "aws_sns_topic_subscription" "shipment_milestone_stream_sns_subscription" {
  topic_arn = "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-shipment-milestone-${var.env}"
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.omni_wd_infra_shipment_milestone_stream_queue.arn
  filter_policy = jsonencode({
    "FK_OrderStatusId" : ["PUP", "DPO", "AAP", "CEH", "CCL", "APD", "DAR", "DEL", "REF", "COB", "POD", "OSD"]
  })
}
