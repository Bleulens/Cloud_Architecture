.PHONY: init plan apply destroy

# 1️⃣ Initialize Terraform
# - Downloads providers and sets up the backend
init:
	terraform init

# 2️⃣ Generate a Terraform plan **for networking resources only**
# - Targets VPC, subnets, routing, and IGW to preview infrastructure changes
plan_network:
	terraform plan -target=module.vpc -target=module.public_subnets -target=module.public_routing -target=module.private_routing -target=module.private_subnets -target=module.igw

# 3️⃣ Generate a full Terraform plan and save it as `tfplan`
# - This ensures that all configurations are stored for later execution
plan:
	terraform plan -out=tfplan

# 4️⃣ Apply **only networking resources** (matching `plan_network`)
# - Executes targeted resources without a saved plan file
apply_network:
	terraform apply -target=module.vpc -target=module.public_subnets -target=module.public_routing -target=module.private_routing -target=module.private_subnets -target=module.igw

# 5️⃣ Apply the **full Terraform plan** using `tfplan`
# - Ensures all planned configurations are deployed consistently
apply:
	terraform apply tfplan

# 6️⃣ Destroy all Terraform-managed resources
# - Removes infrastructure and cleans up state
destroy:
	terraform destroy