locals {
  loyalty_context_details = zipmap(var.loyalty_context, var.loyalty_stackgroup)
}

module "nlb_loyalty" {
  source = "git::https://scm.bestwestern.com/scm/tfr/terraform-aws-nlb.git?ref=v0.5.5"
  providers = {
    aws = aws.a133-r5
  }
  for_each = local.loyalty_context_details
  nlb_port_config = [
    {
      port         = 443
      target_port  = 8443
      proto        = "TLS"
      tgt_type     = "instance"
      cert_arn     = aws_acm_certificate.loyalty_services.arn
      ssl_policy   = var.ssl_policy
      targets      = data.aws_instances.loyalty_services[each.key].ids
      monitor_port = 8443
    }
  ]
  subnet_names = var.subnet_names
  internal     = var.internal
  cross_zone   = false
  ssl_policy   = var.ssl_policy
  tg_reg_az    = null
  is_dr        = false
  is_mvf       = false
  reg_pci      = false
  environment  = var.environment
  name         = each.key
  service      = "loyalty"
  my_username  = var.my_username
}