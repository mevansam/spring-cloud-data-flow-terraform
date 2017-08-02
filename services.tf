#
# Backing services for SCDF
#

data "cf_service" "redis" {
  name = "p-redis"
}

resource cf_service_instance "scdf-redis" {
  name        = "scdf-redis"
  space       = "${data.cf_space.scdf-target.id}"
  servicePlan = "${data.cf_service.redis.service_plans[var.scdf_redis_plan]}"
}

data "cf_service" "mysql" {
  name = "p-mysql"
}

resource cf_service_instance "scdf-mysql" {
  name        = "scdf-mysql"
  space       = "${data.cf_space.scdf-target.id}"
  servicePlan = "${data.cf_service.mysql.service_plans[var.scdf_mysql_plan]}"
}

data "cf_service" "rabbitmq" {
  name = "p-rabbitmq"
}

resource cf_service_instance "scdf-rabbitmq" {
  name        = "scdf-rabbitmq"
  space       = "${data.cf_space.scdf-target.id}"
  servicePlan = "${data.cf_service.rabbitmq.service_plans[var.scdf_rabbitmq_plan]}"
}
