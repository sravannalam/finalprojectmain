resource "aws_api_gateway_base_path_mapping" "auth_api_mapping" {
  provider    = aws.a133-r5
  for_each    = local.loyalty_context_details
  api_id      = module.loyalty_context[each.key].api_id
  stage_name  = module.loyalty_context[each.key].api_stage_name
  domain_name = aws_api_gateway_domain_name.domain_services.domain_name
  base_path   = each.key
}