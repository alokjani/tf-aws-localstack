resource "aws_kinesis_stream" "localstack_processed_sales_order_events_kinesis" {
  name             = "localstack-processed-sales-order-events"
  shard_count      = 1
  retention_period = 30

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]
}

