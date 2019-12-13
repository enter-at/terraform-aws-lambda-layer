resource "aws_lambda_layer_version" "main" {
  filename            = data.archive_file.layer.output_path
  layer_name          = var.layer_name
  source_code_hash    = data.archive_file.layer.output_base64sha256
  compatible_runtimes = var.compatible_runtimes
}
