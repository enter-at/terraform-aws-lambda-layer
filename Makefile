SHELL := /bin/bash

# List of targets the `readme` target should call before generating the readme
export README_DEPS ?= docs/terraform.md
export README_TEMPLATE_FILE ?= .README.md.gotmpl
export TERRAFORM_VERSION ?= 0.12.18

-include $(shell curl -sSL -o .build-harness "https://git.io/build-harness"; echo .build-harness)
-include $(shell curl -sSL -o $(README_TEMPLATE_FILE) "https://git.io/enter-at-readme")

## Lint terraform code
lint:
	$(SELF) terraform/install terraform/get-modules terraform/get-plugins terraform/lint terraform/validate