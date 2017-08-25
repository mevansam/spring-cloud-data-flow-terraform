# Spring Cloud Data Flow Service

## Overview

This [Terraform](https://www.terraform.io/) module deploys Spring Cloud Data Flow (SCDF) services to a target Cloud Foundry. It requires the [Cloud Foundry Terraform provider](https://github.com/mevansam/terraform-provider-cloudfoundry).

> The Cloud Foundry provider is not available as a default Terraform provider so it needs to be installed by downloading the Cloud Foundry provider release from its GitHub repository.

## Usage

To use this module use the following HCL snippet as an example. 

```
#
# Spring Cloud Data Flow deployment
#

module "scdf-myscdf" {
  source = "github.com/mevansam/spring-cloud-data-flow-terraform"

  org_name         = "scdf-test-org"
  space_name       = "development"
  root_domain_name = "apps.acme.io"
  route_postfix    = "myscdf"
}
```

The following variables are supported.

* org_name - (Type: String) The organization to which Spring Cloud Data Flow should be deployed to.

* space_name - (Type: String) The space to which Spring Cloud Data Flow should be deployed to.

* scdf_redis_plan - (Type: String) The Redis service plan to use for SCDF. The default is 'shared'.

* scdf_rabbitmq_plan - (Type: String) The RabbitMQ service plan to use for SCDF. The default is 'standard'.

* scdf_mysql_plan - (Type: String) The MySQL service plan to use for SCDF. The default is '100mb'.

* scdf_server_version - (Type: String) The version of the Spring Cloud Data Flow server to deploy. The default is "1.2.0".

* num_server_instances - (Type: Number) Number of service instances to start. The default is 1.

* root_domain_name - (Type: String) The root domain to use when mapping routes.

* route_postfix - (Type: String) A name to postfix the server hostname with to create a unique route to the Spring Cloud Data Flow server.

