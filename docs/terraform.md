<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lambda_layer_version.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version) | resource |
| [null_resource.build](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_uuid.id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |
| [archive_file.layer](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compatible_runtimes"></a> [compatible\_runtimes](#input\_compatible\_runtimes) | (Optional) A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified. | `list(string)` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) Description of what the Lambda layer does. | `string` | `null` | no |
| <a name="input_layer_name"></a> [layer\_name](#input\_layer\_name) | (Required) A unique name for the Lambda Layer. | `string` | n/a | yes |
| <a name="input_package_file"></a> [package\_file](#input\_package\_file) | (Optional) The location of the package manager config file. Can be one of (package.json, requirements.txt, Pipfile) | `string` | `null` | no |
| <a name="input_rsync_pattern"></a> [rsync\_pattern](#input\_rsync\_pattern) | (Optional) A list of rsync pattern to include or exclude files and directories. | `list(string)` | <pre>[<br>  "--include=*"<br>]</pre> | no |
| <a name="input_source_dir"></a> [source\_dir](#input\_source\_dir) | (Optional) The location of the Lamvda layer source code. Requires source\_type to be defined. | `string` | `null` | no |
| <a name="input_source_type"></a> [source\_type](#input\_source\_type) | (Optional) The location of the Lambda layer source type. Can be one of (nodejs, python) | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_archive_path"></a> [archive\_path](#output\_archive\_path) | Path to archive file |
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the Lambda layer with version. |
| <a name="output_created_date"></a> [created\_date](#output\_created\_date) | The date the layer was created. |
| <a name="output_layer_arn"></a> [layer\_arn](#output\_layer\_arn) | The Amazon Resource Name (ARN) of the Lambda layer without version. |
| <a name="output_source_code_size"></a> [source\_code\_size](#output\_source\_code\_size) | The size in bytes of the layer .zip file. |
| <a name="output_version"></a> [version](#output\_version) | The Lamba layer version. |
<!-- markdownlint-restore -->
