# 🚀 #TerraWeek Challenge | Day 02: HCL Deep Dive — Variables, Types & Expressions

Welcome to my implementation blueprint for **Day 02** of the `#TerraWeek Challenge`, hosted by Shubham Londhe and the TrainWithShubham community. Today's focus bridges foundational deployments into advanced, flexible, and production-grade **HashiCorp Configuration Language (HCL)** configurations.

---

## 📚 Task 1: Master HCL Syntax

### 1. Anatomy of an HCL Block
In HCL, infrastructure intent is written structurally via blocks. The standard layout follows this pattern:

```hcl
block_type "label_one" "label_two" {
  argument = value
}
block_type: Represents the configuration stanza target (e.g., resource, variable, output, provider).Labels: Opaque identifiers specifying the block's exact variant type and its logical target name.Body ({...}): A scope containing attributes, arguments, and nested structural blocks.2. Difference Between an Argument and a BlockArgument: A configuration setting that assigns a specific value to an attribute name within a block scope (e.g., external = 8080). It represents a concrete key-value pair.Block: A structural structural container that can hold arguments, expressions, or nested sub-blocks (e.g., ports { ... }). Blocks define the operational framework or objects themselves.3. Expressions & Logic RealizationString Interpolation ("${...}"): Allows evaluation of variables or function calls within literal string outputs.Example: name = "${local.calculated_prefix}-nginx-web"References: Dot-notation paths used to resolve parameters from other workspace components dynamically.Example: image = docker_image.nginx_image.image_id tracks dependencies implicitly.🧩 Task 3: Core HCL Terminologies ExplainedProvider: A system translation plugin that exposes downstream platform APIs to Terraform Core engine hooks.Example: The kreuzwerker/docker provider maps HCL definitions directly into local Docker engine socket operations.Resource: A distinct architectural component or asset provisioned and monitored within the execution landscape.Example: An isolated Nginx container block deployed onto the targeted infrastructure daemon.State: A centralized source-of-truth metadata file (terraform.tfstate) tracking real-world asset statuses against workspace codebase configurations.Plan: A zero-impact dry-run execution blueprint illustrating expected addition, mutation, or deletion phases.HCL: HashiCorp Configuration Language; a declarative, human-readable domain-specific language customized for infrastructure automation.Module: A self-contained, structural directory grouping common resource specifications together to achieve architectural reuse.⚙️ Task 2 & 4: Variable Topology & Dynamic Engine WorkflowThis sandbox configurations utilizes Primitives, Collections, and Complex Structural objects to drive a local Docker image and container workspace seamlessly.Workspace Directory MapPlaintext.
├── main.tf                 # Core execution expressions & local functions
├── outputs.tf              # Post-execution status metrics delivery hooks
├── terraform.tf            # Version control constraints & locked providers
├── terraform.tfvars        # Default parameter variables layout definition
└── variables.tf            # Structural input parameters definitions mapping
💻 Live Interaction Verification Checklist1. Evaluation Sandbox (terraform console)Validated built-in HCL runtime functions to shape layout logic prior to writing resources:Plaintext$ terraform console
> upper("terraweek")
"TERRAWEEK"
> merge({a=1}, {b=2})
{
  "a" = 1
  "b" = 2
}
> join("-", ["tws", "terraweek", "2026"])
"tws-terraweek-2026"
2. Workspace Initialization (terraform init)Bash$ terraform init
Initializing the backend...
Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "~> 3.0.0"...
- Installing kreuzwerker/docker v3.0.1...
- Installed kreuzwerker/docker v3.0.1 (signed by a HashiCorp partner)

Terraform has been successfully initialized!
3. Execution Schema Preview (terraform plan)Evaluating configuration parsing with explicit parameter passing variations:Bash$ terraform plan -var 'container_name=tws-web' -var 'external_port=8080'
4. Applying Desired Configuration Changes (terraform apply)Executing the target runtime loop natively.Bash$ terraform apply -var 'container_name=tws-web' -var 'external_port=8080' --auto-approve

docker_image.nginx_image: Creating...
docker_image.nginx_image: Creation complete after 2s
docker_container.web_server: Creating...
docker_container.web_server: Creation complete after 1s

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:
application_endpoint = "http://localhost:8080"
container_id = "1a2b3c4d5e6f7g8h9i..."
secured_credential_test = <sensitive>
transformed_hosts = [
  "HOST-NODE1",
  "HOST-NODE2",
]
(Verify by curling or browsing to http://localhost:8080 to see the standard Nginx greeting page!)5. De-provisioning Assets (terraform destroy)Bash$ terraform destroy -var 'container_name=tws-web' -var 'external_port=8080' --auto-approve
docker_container.web_server: Destroying...
docker_container.web_server: Destruction complete after 1s
docker_image.nginx_image: Destroying...
docker_image.nginx_image: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.
📊 Deep-Dive Discoveries & Variable Precedence1. Variable Precedence HierarchyDuring execution conflicts, Terraform resolves values via a strict top-down layout evaluation rule:$$\text{Highest Precedence } (\text{Wins}) \longrightarrow \text{ Lowest Precedence } (\text{Loses})$$-var and -var-file flags passed directly to the shell invocation line.*.auto.tfvars or *.auto.tfvars.json automated files.terraform.tfvars or terraform.tfvars.json properties sheets.TF_VAR_ environment variables exported within terminal runtimes.default attribute value declarations stated inside the schema definition blocks.2. The Dependency Lock File (.terraform.lock.hcl)The auto-generated dependency lock file acts as a critical security control mechanism for operations:Implements Precise Checksums (zh:): Prevents untrusted downstream upstream supply chain updates from breaking live production platforms.Enforces Multi-Workstation Determinism: Guarantees that separate engineering teammates or distributed automated CI/CD runners load identical provider binary hashes when pulling software components down during terraform init.
