# Generate random IDs for resources
resource "random_id" "instance" {
  count       = var.instance_count
  byte_length = 4
}

# Create local files to simulate resource creation
resource "local_file" "instance_config" {
  count    = var.instance_count
  filename = "${var.output_directory}/instance-${count.index + 1}-config.json"

  content = jsonencode({
    id          = random_id.instance[count.index].hex
    name        = "${var.project_name}-instance-${count.index + 1}"
    environment = var.environment
    index       = count.index + 1
    total_count = var.instance_count
    monitoring  = var.enable_monitoring
    created_at  = timestamp()
    tags = merge(
      var.tags,
      {
        Environment = var.environment
        Project     = var.project_name
        ManagedBy   = "Terraform"
        Name        = "${var.project_name}-instance-${count.index + 1}"
      }
    )
  })

  depends_on = [local_file.output_dir]
}

# Create output directory
resource "local_file" "output_dir" {
  filename = "${var.output_directory}/.terraform_managed"
  content  = "This directory is managed by Terraform\n"
}

# Create a summary file
resource "local_file" "summary" {
  filename = "${var.output_directory}/summary.txt"

  content = <<-EOT
    Terraform Hands-On Practice Configuration
    ==========================================
    
    Project Name: ${var.project_name}
    Environment: ${var.environment}
    Instance Count: ${var.instance_count}
    Monitoring Enabled: ${var.enable_monitoring}
    
    Resources Created:
    - ${var.instance_count} instance configuration files
    - 1 summary file
    
    Instance IDs Generated:
    ${join("\n    ", [for i, id in random_id.instance[*].hex : "- instance-${i + 1}: ${id}"])}
    
    Directory: ${var.output_directory}
    
    This is a local demonstration of Terraform without cloud provider dependencies.
    All "resources" are stored as local files for learning and practice.
  EOT

  depends_on = [local_file.instance_config]
}

# Create a simple null resource trigger for actions
resource "null_resource" "example" {
  triggers = {
    instance_count = var.instance_count
    environment    = var.environment
  }

  provisioner "local-exec" {
    command = "echo 'Terraform configuration applied successfully'"
  }
}
