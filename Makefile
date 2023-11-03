## Remove all Terraform lock files
terraform-rm-lockfiles:
	$(shell find . -name ".terraform.lock.hcl" -exec rm -v {} \;)

## Rebuild README for all Terraform modules
rebuild-docs: packages/install/terraform-docs
	@pre-commit run --all-files terraform_docs

## Pipeline commands
validate:
	terraform fmt -recursive
	terraform validate

