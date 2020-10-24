<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| archive | n/a |
| aws | n/a |
| null | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| compatible\_runtimes | (Optional) A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified. | `list(string)` | `null` | no |
| description | (Optional) Description of what the Lambda layer does. | `string` | `null` | no |
| layer\_name | (Required) A unique name for the Lambda Layer. | `string` | n/a | yes |
| package\_file | (Optional) The location of the package manager config file. Can be one of (package.json, requirements.txt, Pipfile) | `string` | `null` | no |
| rsync\_pattern | (Optional) A list of rsync pattern to include or exclude files and directories. | `list(string)` | <pre>[<br>  "--include=*"<br>]</pre> | no |
| source\_dir | (Optional) The location of the Lamvda layer source code. Requires source\_type to be defined. | `string` | `null` | no |
| source\_type | (Optional) The location of the Lambda layer source type. Can be one of (nodejs, python) | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) of the Lambda layer with version. |
| created\_date | The date the layer was created. |
| layer\_arn | The Amazon Resource Name (ARN) of the Lambda layer without version. |
| source\_code\_size | The size in bytes of the layer .zip file. |
| version | The Lamba layer version. |

<!-- markdownlint-restore -->
