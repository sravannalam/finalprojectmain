resource "aws_api_gateway_vpc_link" "vpclink_auth" {
  provider    = aws.a133-r5
  name        = "loyalty-auth-api"
  description = "To call auth context"
  target_arns = [module.nlb_loyalty["auth"].nlb.arn]
}

resource "aws_api_gateway_vpc_link" "vpclink_rewards" {
  provider    = aws.a133-r5
  name        = "loyalty-rewards-api"
  description = "To call rewards context"
  target_arns = [module.nlb_loyalty["rewards"].nlb.arn]
}


resource "aws_api_gateway_vpc_link" "vpclink_rewards-admin" {
  provider    = aws.a133-r5
  name        = "loyalty-rewards-admin-api"
  description = "To call rewards context"
  target_arns = [module.nlb_loyalty["rewards-admin"].nlb.arn]
}


resource "aws_api_gateway_vpc_link" "vpclink_rewards-partners" {
  provider    = aws.a133-r5
  name        = "loyalty-rewards-partners-api"
  description = "To call rewards context"
  target_arns = [module.nlb_loyalty["rewards-partners"].nlb.arn]
}