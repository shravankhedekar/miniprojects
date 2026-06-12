# Terraform Hands-On Practice

A beginner-friendly Terraform project for learning infrastructure-as-code concepts **without requiring cloud provider credentials**.

## Features

✅ **No Cloud Dependencies** - Uses local files and random providers  
✅ **Learn Terraform Fundamentals** - Variables, outputs, resources, loops, functions  
✅ **Hands-On Exercises** - Progressive exercises to build Terraform skills  
✅ **CI/CD Ready** - GitHub Actions pipeline with validation and linting  
✅ **Portable** - Works on Windows, Mac, and Linux  

## Project Structure

```
.
├── providers.tf       # Provider configuration (null, local, random)
├── variables.tf       # Input variables with validation
├── main.tf           # Resource definitions
├── outputs.tf        # Output values
├── terraform.tfvars  # Variable values (customize here)
├── .tflint.hcl       # TFLint configuration
├── .checkov.yaml     # Security scanning config
└── .gitignore        # Git ignore rules
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) >= 1.0
- Git (for version control)
- Text editor or IDE (VS Code recommended)

**No cloud account needed!**

## Quick Start

### 1. Initialize Terraform

```bash
terraform init
```

This downloads the required providers and sets up the working directory.

### 2. Review the Plan

```bash
terraform plan
```

This shows what resources will be created without applying changes.

### 3. Apply Configuration

```bash
terraform apply
```

Type `yes` to confirm. This creates local configuration files in the `outputs/` directory.

### 4. View Outputs

```bash
terraform output
```

This displays generated resource IDs, names, and other outputs.

### 5. Inspect Created Files

```bash
ls -la outputs/
cat outputs/summary.txt
cat outputs/instance-1-config.json
```

### 6. Destroy Resources

```bash
terraform destroy
```

Type `yes` to confirm and clean up all local files.

## Configuration

### Customize Variables

Edit `terraform.tfvars` to modify:

- **project_name**: Project identifier (default: hands-on)
- **environment**: Environment type - dev/staging/prod (default: dev)
- **instance_count**: Number of instances to create (1-10, default: 3)
- **enable_monitoring**: Enable monitoring flag (default: true)
- **output_directory**: Where to store generated files (default: ./outputs)
- **tags**: Additional resource tags

Example:
```hcl
project_name   = "my-project"
environment    = "staging"
instance_count = 5
enable_monitoring = true

tags = {
  Owner      = "DevOps Team"
  CostCenter = "Engineering"
}
```

## What This Project Creates

When you run `terraform apply`:

1. **Instance Configuration Files** - JSON files representing each instance
2. **Summary File** - Overview of created resources
3. **Output Directory** - Managed directory for all generated files

Example output:
```
outputs/
├── .terraform_managed      # Directory marker
├── instance-1-config.json  # Instance 1 configuration
├── instance-2-config.json  # Instance 2 configuration
├── instance-3-config.json  # Instance 3 configuration
└── summary.txt            # Project summary
```

## Hands-On Exercises

### Exercise 1: Deploy the Base Configuration
```bash
terraform init
terraform plan
terraform apply
terraform output
```
Observe the created files in the `outputs/` directory.

### Exercise 2: Scale the Infrastructure
- Change `instance_count = 5` in `terraform.tfvars`
- Run `terraform plan` to see what will change
- Run `terraform apply` to create new files
- Check `outputs/` for new instance configuration files

### Exercise 3: Modify Variables
- Change `environment = "prod"` in `terraform.tfvars`
- Run `terraform plan` to see resource updates
- Run `terraform apply` to apply changes
- Check summary file for updated configuration

### Exercise 4: Use Terraform State
```bash
# List all resources
terraform state list

# Show details of a specific resource
terraform state show local_file.summary

# Refresh state
terraform refresh
```

### Exercise 5: Output Manipulation
```bash
# Show all outputs
terraform output

# Show specific output
terraform output instance_ids

# Output in JSON
terraform output -json

# Output to file
terraform output -json > outputs.json
```

## Key Terraform Concepts Demonstrated

- **Providers**: Local, Random, and Null providers
- **Resources**: local_file, random_id, null_resource
- **Variables**: Input variables with validation
- **Outputs**: Computed and derived output values
- **Loops**: Using `count` for multiple resources
- **Splat Expressions**: `[*]` syntax for output arrays
- **Functions**: `merge()`, `jsonencode()`, `range()`, `join()`
- **String Interpolation**: Template literals
- **Dependencies**: Explicit `depends_on` declarations
- **Provisioners**: Local-exec provisioner examples

## Useful Commands

```bash
# Initialization
terraform init
terraform init -upgrade

# Planning and Validation
terraform plan
terraform validate
terraform fmt -recursive

# Applying Changes
terraform apply
terraform apply -auto-approve
terraform apply -target=resource.name

# State Management
terraform state list
terraform state show resource.name
terraform state rm resource.name
terraform refresh

# Outputs
terraform output
terraform output -json
terraform output -raw output_name

# Debugging
terraform console
terraform graph
terraform fmt -check

# Cleanup
terraform destroy
terraform destroy -auto-approve
terraform destroy -target=resource.name
```

## CI/CD Pipeline

This project includes a GitHub Actions pipeline that runs:

✅ **Terraform Format Check** - Ensures consistent code style  
✅ **Terraform Validation** - Checks syntax and configuration  
✅ **TFLint** - Best practices and standards checking  
✅ **Checkov** - Security compliance scanning  
✅ **Terraform Plan** - Generates execution plan  

To use:
1. Push code to GitHub
2. Checks run automatically on push and pull requests
3. Results appear in GitHub Actions tab

## File Descriptions

| File | Purpose |
|------|---------|
| `providers.tf` | Declares provider requirements and versions |
| `variables.tf` | Defines input variables with validation rules |
| `main.tf` | Main resource and data source definitions |
| `outputs.tf` | Defines what values to display after apply |
| `terraform.tfvars` | Variable value overrides (edit this!) |
| `.tflint.hcl` | TFLint configuration for code quality |
| `.checkov.yaml` | Checkov security scanning rules |
| `.github/workflows/terraform.yml` | CI/CD pipeline definition |

## Learning Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [Terraform Language Reference](https://www.terraform.io/language)
- [Terraform Best Practices](https://www.terraform.io/language/values/variables)
- [Local Provider](https://registry.terraform.io/providers/hashicorp/local/latest/docs)
- [Random Provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs)
- [Null Provider](https://registry.terraform.io/providers/hashicorp/null/latest/docs)

## Troubleshooting

### Error: "terraform command not found"
- Install Terraform from https://www.terraform.io/downloads
- Add to PATH if necessary

### Error: "Failed to initialize provider"
- Run: `terraform init -upgrade`
- Check internet connection for plugin downloads

### Files not created in outputs/
- Check `terraform.tfvars` for `output_directory` setting
- Ensure the path is accessible and writable
- Run `terraform destroy` then `terraform apply` again

### State file issues
- Never manually delete `.terraform` directory
- Always use `terraform destroy` to remove resources
- Use `terraform state` commands for state management

## Next Steps

1. **Modify resources**: Add new local_file or random resources
2. **Create variables**: Define new input variables and use them
3. **Build modules**: Organize code into reusable modules
4. **Add workspaces**: Manage multiple environments
5. **Script automation**: Create shell scripts to automate common tasks

## Tips for Learning

- Always run `terraform plan` before `terraform apply`
- Read the plan output carefully to understand changes
- Use `terraform output` to see generated values
- Inspect JSON configuration files created in `outputs/`
- Experiment with different variable combinations
- Review Terraform documentation for new concepts

---

**Happy Learning!** 🚀

This is a local practice environment. Once comfortable with these concepts, you can:
- Switch to AWS provider for cloud infrastructure
- Integrate with real APIs and services
- Build production-grade infrastructure

