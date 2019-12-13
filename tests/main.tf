terraform {
  required_version = ">= 0.12"

  backend "local" {}
}

provider "aws" {
  region = "eu-central-1"
}

module "layer" {
  source       = "../"
  layer_name   = "dependencies"
  package_file = "Pipfile"
}
