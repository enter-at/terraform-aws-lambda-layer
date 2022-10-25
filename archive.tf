resource "random_uuid" "id" {}

locals {
  dist    = abspath("${path.module}/dist/${random_uuid.id.result}")
  archive = "${local.dist}.zip"

}

resource "null_resource" "build" {
  triggers = {
    run = timestamp()
  }

  provisioner "local-exec" {
    command = "${path.module}/build.sh"
    environment = {
      DIST_DIR      = local.dist
      SOURCE_DIR    = var.source_dir
      SOURCE_TYPE   = var.source_type
      PACKAGE_FILE  = var.package_file
      RSYNC_PATTERN = join(" ", var.rsync_pattern)
    }
  }
}

data "archive_file" "layer" {
  type        = "zip"
  source_dir  = local.dist
  output_path = local.archive

  depends_on = [
    null_resource.build
  ]
}
