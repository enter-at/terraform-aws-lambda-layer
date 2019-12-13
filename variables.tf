variable "compatible_runtimes" {
  type        = list(string)
  description = "(Optional) A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified."

  default = null
}

variable "layer_name" {
  type        = string
  description = "(Required) A unique name for the Lambda Layer."
}

variable "description" {
  type        = string
  description = "(Optional) Description of what the Lambda layer does."

  default = null
}

variable "package_file" {
  type        = string
  description = "(Optional) The location of the package manager config file. Can be one of (package.json, requirements.txt, Pipfile)"

  default = null
}

variable "source_dir" {
  type        = string
  description = "(Optional) The location of the Lamvda layer source code. Requires source_type to be defined."

  default = null
}

variable "source_type" {
  type        = string
  description = "(Optional) The location of the Lambda layer source type. Can be one of (nodejs, python)"

  default = null
}

variable "rsync_pattern" {
  type        = list(string)
  description = "(Optional) A list of rsync pattern to include or exclude files and directories."

  default = [
    "--include=*"
  ]
}
