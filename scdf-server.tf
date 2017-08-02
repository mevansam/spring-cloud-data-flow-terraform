#
# Spring Cloud Data Flow server
#

resource "cf_route" "scdf" {
  domain   = "${data.cf_domain.root-domain.id}"
  space    = "${data.cf_space.scdf-target.id}"
  hostname = "scdf-${var.route_postfix}"
}

resource cf_app "scdf-server" {
  name  = "scdf-server"
  space = "${data.cf_space.scdf-target.id}"

  instances  = "${var.num_server_instances}"
  memory     = "2048"
  disk_quota = "2048"

  timeout = "600"

  url = "http://repo.spring.io/snapshot/org/springframework/cloud/spring-cloud-dataflow-server-cloudfoundry/${var.scdf_server_version}.BUILD-SNAPSHOT/spring-cloud-dataflow-server-cloudfoundry-${var.scdf_server_version}.BUILD-SNAPSHOT.jar"

  service_binding {
    service_instance = "${cf_service_instance.scdf-redis.id}"
  }

  service_binding {
    service_instance = "${cf_service_instance.scdf-mysql.id}"
  }

  route {
    default_route = "${cf_route.scdf.id}"
  }

  environment {
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_URL                 = "${data.cf_info.info.api_endpoint}"
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_ORG                 = "${data.cf_space.scdf-target.org_name}"
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_SPACE               = "${data.cf_space.scdf-target.name}"
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_DOMAIN              = "${data.cf_domain.root-domain.name}"
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_SERVICES     = "${cf_service_instance.scdf-rabbitmq.name}"
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_TASK_SERVICES       = "${cf_service_instance.scdf-mysql.name}"
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_USERNAME            = "${data.cf_info.info.user}"
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_PASSWORD            = "${data.cf_info.info.password}"
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_SKIP_SSL_VALIDATION = true

    SPRING_APPLICATION_JSON = <<SPRING_APPLICATION_JSON
{
    "maven": { 
        "remote-repositories": { 
            "repo1": { 
                "url": "https://repo.spring.io/libs-release" 
            } 
        } 
    } 
}
SPRING_APPLICATION_JSON
  }
}
