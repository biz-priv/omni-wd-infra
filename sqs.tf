resource "aws_sqs_queue" "omni_wd_infra_shipment_milestone_stream_queue" {
  name                       = "${var.application}-shipment-milestone-stream-queue-${var.env}"
  visibility_timeout_seconds = 300
}

data "aws_iam_policy_document" "omni_wd_infra_shipment_milestone_stream_queue_policy" {
  policy_id = "${aws_sqs_queue.omni_wd_infra_shipment_milestone_stream_queue.arn}/SQSDefaultPolicy"
  statement {
    sid    = "Allow SNS publish to SQS"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "SQS:SendMessage",
    ]
    resources = [
      aws_sqs_queue.omni_wd_infra_shipment_milestone_stream_queue.arn
    ]
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-shipment-milestone-${var.env}"
      ]
    }
  }
}

resource "aws_sqs_queue_policy" "omni_wd_infra_shipment_milestone_stream_queue_policy" {
  queue_url = aws_sqs_queue.omni_wd_infra_shipment_milestone_stream_queue.id
  policy    = data.aws_iam_policy_document.omni_wd_infra_shipment_milestone_stream_queue_policy.json
}
