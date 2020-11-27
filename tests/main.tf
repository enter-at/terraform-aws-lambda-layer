provider "aws" {
  region = "eu-central-1"
}

module "layer" {
  source       = "../"
  layer_name   = "dependencies"
  package_file = "Pipfile"
}
