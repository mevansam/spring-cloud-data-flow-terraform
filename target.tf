#
# The target org and space to deploy Spring Cloud Data Flow to
#

data "cf_info" "info" {}

data "cf_domain" "root-domain" {
  name = "${var.root_domain_name}"
}

data "cf_space" "scdf-target" {
  name     = "${var.space_name}"
  org_name = "${var.org_name}"
}
