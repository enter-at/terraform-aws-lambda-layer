output "arn" {
  value       = aws_lambda_layer_version.main.arn
  description = "The Amazon Resource Name (ARN) of the Lambda layer with version."
}

output "layer_arn" {
  value       = aws_lambda_layer_version.main.layer_arn
  description = "The Amazon Resource Name (ARN) of the Lambda layer without version."
}

output "version" {
  value       = aws_lambda_layer_version.main.layer_arn
  description = "The Lamba layer version."
}

output "created_date" {
  value       = aws_lambda_layer_version.main.created_date
  description = "The date the layer was created."
}

output "source_code_size" {
  value       = aws_lambda_layer_version.main.source_code_size
  description = "The size in bytes of the layer .zip file."
}

output "archive_path" {
  value = data.archive_file.layer.output_path
  description = "Path to archive file"
}
