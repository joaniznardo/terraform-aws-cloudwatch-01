module "metric_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 2.0"

  alarm_name          = "EC2_CPU_Usage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 12
  threshold           = 50
  period              = 60
  unit                = "Count"

  namespace   = "AWS/EC2"
  metric_name = "CPUUtilization"
  statistic   = "Average"

#  alarm_actions = ["arn:aws:sns:us-east-1:585584209241:cpu_utilization"]
  alarm_actions = ["arn:aws:sns:us-east-1:807649330085:alarma-cpu-email"]
}
