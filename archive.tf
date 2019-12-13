resource "random_uuid" "id" {}

data "null_data_source" "dist" {
  inputs = {
    path = abspath("${path.module}/dist/${random_uuid.id.result}")
  }
}

data "null_data_source" "archive" {
  inputs = {
    path = "${data.null_data_source.dist.outputs.path}.zip"
  }
}

resource "null_resource" "build" {
  triggers = {
    run = timestamp()
  }

  provisioner "local-exec" {
    command = "${path.module}/build.sh"
    environment = {
      DIST_DIR     = data.null_data_source.dist.outputs.path
      SOURCE_DIR   = var.source_dir
      SOURCE_TYPE  = var.source_type
      PACKAGE_FILE = var.package_file
    }
  }
}

data "archive_file" "layer" {
  type        = "zip"
  source_dir  = data.null_data_source.dist.outputs.path
  output_path = data.null_data_source.archive.outputs.path

  depends_on = [
    null_resource.build
  ]
}
