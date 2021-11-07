variable "my_username" {
  type = string
}

variable "vault_addr" {
  type = string
}

variable "vault_cacert" {
  type = string
}

variable "r53_zone_private" {
  type    = string
  default = ""
}

variable "subnet_names" {
  type        = list(string)
  default     = null
  description = <<EOF
The list of subnet names to create a listener in. An IP address will be assigned automatically to each interface. Mutually exclusive with `subnet_map`.
EOF
}

variable "subnet_map" {
  type = list(object({
    name          = string
    allocation_id = string
  }))
  default     = null
  description = "The list of subnet names to create a listener in. Overrides any setting in `subnet_names`."
}

variable "internal" {
  type        = bool
  default     = true
  description = "Should the NLB be internally accessible only? Setting to `false` requires a VPC configured Internet Gateway."
}

variable "cross_zone" {
  type        = bool
  default     = false
  description = "Should the NLB allow cross availability zone routing? This may incur additional cost for network bandwidth."
}

variable "ssl_policy" {
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
  description = "SSL policy for the NLB. Required if `nlb_port_config[*]proto` is `HTTPS` or `TLS`"
}

variable "tg_reg_az" {
  type        = string
  default     = null
  description = "The Availability Zone where the IP address of the target is to be registered. If the private ip address is outside of the VPC scope, this value must be set to 'all'."
}

variable "is_dr" {
  type        = bool
  default     = false
  description = "Is this resource a disaster recovery instance?"
}

variable "is_mvf" {
  type        = bool
  default     = true
  description = "Is this resource included in the minimum required instances for a viable service?"
}

variable "reg_pci" {
  type        = bool
  default     = false
  description = "Does this resource process PCI data?"
}

variable "environment" {
  type        = string
  description = "The environment of this resource."
  default     = ""
}

variable "name" {
  type    = string
  default = ""
}

variable "tags_optional" {
  description = "A map of additional tags to apply. Any required tags will supersede a corresponding tag defined here."
  type        = map(string)
  default     = {}
}

variable "service" {
  type    = string
  default = ""
}

variable "deletion_protection" {
  type        = bool
  default     = false
  description = "Enable/Disable deletion_protection"
}

variable "evaluation_periods" {
  type    = number
  default = 3
}

variable "period" {
  type    = number
  default = 120
}

variable "enable_monitoring" {
  type        = bool
  default     = true
  description = "Add CloudWatch monitoring to this network load balancer."
}

variable "nlb_unhealthy_host_count_threshold" {
  type    = number
  default = 1
}

variable "alarm_notification_arns" {
  type    = string
  default = null
}

variable "ok_notification_arns" {
  type    = string
  default = null
}

variable "domain_name" {
  type = string
}
variable "region" {
  type    = string
  default = "us-west-2"
}
variable "domain" {
  type    = string
  default = "bwhhg.io"
}
variable "hostname_prefix" {
  type        = string
  default     = "internal-services"
  description = "Hostname for stack"
}

variable "loyalty_context" {
  type = list(any)
}

variable "loyalty_stackgroup" {
  type = list(any)
}

variable "stage_name" {
  type = string
}

variable "subnet_band" {
  type = string
}

# variable "crl_bucket" {
#   type = string
# }

# variable "crl_filename" {
#   type = string
# }

variable "authorizer_type" {
  type = string
}