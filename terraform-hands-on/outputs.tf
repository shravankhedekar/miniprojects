output "instance_ids" {
  description = "Generated IDs for instances"
  value       = random_id.instance[*].hex
}

output "instance_count" {
  description = "Total number of instances created"
  value       = var.instance_count
}

output "instance_names" {
  description = "Names of created instances"
  value       = [for i in range(var.instance_count) : "${var.project_name}-instance-${i + 1}"]
}

output "output_directory" {
  description = "Directory where configuration files are stored"
  value       = var.output_directory
}

output "configuration_files" {
  description = "List of generated configuration files"
  value       = local_file.instance_config[*].filename
}

output "summary_file" {
  description = "Path to the summary file"
  value       = local_file.summary.filename
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}

output "project_info" {
  description = "Complete project information"
  value = {
    name             = var.project_name
    environment      = var.environment
    instance_count   = var.instance_count
    monitoring       = var.enable_monitoring
    output_directory = var.output_directory
    total_resources  = var.instance_count + 2
  }
}
