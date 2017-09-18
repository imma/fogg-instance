module "instance" {
  source = "git@github.com:imma/fogg-instance"

  global_bucket = "${var.remote_bucket}"
  global_key    = "${var.remote_org_path}"
  global_region = "${var.remote_region}"

  env_bucket = "${var.remote_bucket}"
  env_key    = "${var.remote_env_path}"
  env_region = "${var.remote_region}"

  app_bucket = "${var.remote_bucket}"
  app_key    = "${var.remote_app_path}"
  app_region = "${var.remote_region}"

  service_bucket = "${var.remote_bucket}"
  service_key    = "${var.remote_service_path}"
  service_region = "${var.remote_region}"
}

data "terraform_remote_state" "org" {
  backend = "s3"

  config {
    bucket         = "${var.remote_bucket}"
    key            = "${var.remote_org_path}"
    region         = "${var.remote_region}"
    dynamodb_table = "terraform_state_lock"
  }
}

data "terraform_remote_state" "env" {
  backend = "s3"

  config {
    bucket         = "${var.remote_bucket}"
    key            = "${var.remote_env_path}"
    region         = "${var.remote_region}"
    dynamodb_table = "terraform_state_lock"
  }
}

data "terraform_remote_state" "app" {
  backend = "s3"

  config {
    bucket         = "${var.remote_bucket}"
    key            = "${var.remote_app_path}"
    region         = "${var.remote_region}"
    dynamodb_table = "terraform_state_lock"
  }
}

data "terraform_remote_state" "service" {
  backend = "s3"

  config {
    bucket         = "${var.remote_bucket}"
    key            = "${var.remote_service_path}"
    region         = "${var.remote_region}"
    dynamodb_table = "terraform_state_lock"
  }
}
