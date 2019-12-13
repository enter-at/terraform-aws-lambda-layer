## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| compatible_runtimes | (Optional) A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified. | list(string) | `null` | no |
| description | (Optional) Description of what the Lambda layer does. | string | `null` | no |
| layer_name | (Required) A unique name for the Lambda Layer. | string | - | yes |
| package_file | (Optional) The location of the package manager config file. Can be one of (package.json, requirements.txt, Pipfile) | string | `null` | no |
| rsync_pattern | (Optional) A list of rsync pattern to include or exclude files and directories. | list(string) | `<list>` | no |
| source_dir | (Optional) The location of the Lamvda layer source code. Requires source_type to be defined. | string | `null` | no |
| source_type | (Optional) The location of the Lambda layer source type. Can be one of (nodejs, python) | string | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) of the Lambda layer with version. |
| created_date | The date the layer was created. |
| layer_arn | The Amazon Resource Name (ARN) of the Lambda layer without version. |
| source_code_size | The size in bytes of the layer .zip file. |
| version | The Lamba layer version. |

