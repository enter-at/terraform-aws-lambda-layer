terraform {
  required_version = ">= 0.12"

  backend "local" {}
}

module "module" {
  source = "../"
}
