## Remove all Terraform lock files
terraform-rm-lockfiles:
	$(shell find . -name ".terraform.lock.hcl" -exec rm -v {} \;)

## Rebuild README for all Terraform modules
docs:
	@pre-commit run --all-files terraform_docs

validate:
	terraform validate

fmt:
	terraform fmt -recursive

