resource "aws_api_gateway_domain_name" "domain_services" {
  provider                 = aws.a133-r5
  domain_name              = var.domain_name
  regional_certificate_arn = aws_acm_certificate.loyalty_services.arn
  security_policy          = "TLS_1_2"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

#### creating apigateway account to enable logging ####
resource "aws_api_gateway_account" "services" {
  provider            = aws.a133-r5
  cloudwatch_role_arn = aws_iam_role.cloudwatch.arn
}

resource "aws_route53_record" "subdomain_private" {
  provider = aws.a134-r5
  zone_id  = data.aws_route53_zone.selected_private.id

  name = aws_api_gateway_domain_name.domain_services.domain_name
  type = "A"
  alias {
    name                   = aws_api_gateway_domain_name.domain_services.regional_domain_name
    zone_id                = aws_api_gateway_domain_name.domain_services.regional_zone_id
    evaluate_target_health = true
  }
}