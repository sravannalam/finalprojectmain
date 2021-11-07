locals {
  loyalty_contexts = { for context in var.loyalty_context :
    context => {
      api_name        = context
      api_description = "API for loyalty ${context} Context"
      integration_uri = "https://${var.domain_name}/${context}/{proxy}"
    }
  }
}


module "loyalty_context" {
  source = "git::https://scm.bestwestern.com/scm/tfr/terraform-aws-apigateway.git?ref=v0.1.4"

  providers = {
    aws = aws.a133-r5
  }
  for_each                  = local.loyalty_contexts
  api_name                  = each.key
  api_description           = each.value["api_description"]
  api_http_method           = "ANY"
  method_authorization_type = "NONE"
  method_request_parameters = {
    "method.request.header.Authorization-Name" = true
    "method.request.path.proxy"                = true
  }
  integration_type            = "HTTP_PROXY"
  integration_uri             = each.value["integration_uri"]
  integration_connection_type = "VPC_LINK"
  identity_source             = null
  vpclink_id                  = data.aws_api_gateway_vpc_link.loyalty_vpc_link[each.key].id
  stage_name                  = var.stage_name
  integration_request_parameters = {
    "integration.request.path.proxy" = "method.request.path.proxy"
  }
  my_username = var.my_username
}