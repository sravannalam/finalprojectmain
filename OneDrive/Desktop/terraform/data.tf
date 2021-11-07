################################################################################
# Data Sources

data "aws_route53_zone" "selected_private" {
  provider = aws.a134-r5

  name         = var.r53_zone_private
  private_zone = true
}

data "aws_instances" "loyalty_services" {
  provider = aws.a133-r5
  for_each = local.loyalty_context_details
  filter {
    name   = "tag:StackGroup"
    values = [each.value]
  }
}

data "aws_api_gateway_vpc_link" "loyalty_vpc_link" {
  provider = aws.a133-r5
  depends_on = [aws_api_gateway_vpc_link.vpclink_auth,
    aws_api_gateway_vpc_link.vpclink_rewards,
    aws_api_gateway_vpc_link.vpclink_rewards-admin,
    aws_api_gateway_vpc_link.vpclink_rewards-partners,

  ]
  for_each = local.loyalty_contexts
  name     = "loyalty-${each.key}-api"
}