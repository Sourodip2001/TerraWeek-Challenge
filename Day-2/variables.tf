# --- Primitives ---
variable "environment" {
  description = "Deployment environment lifecycle stage"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "The environment variable must be strictly one of: dev, staging, prod."
  }
}

variable "container_count" {
  description = "Number of active instances to spin up"
  type        = number
  default     = 1
}

variable "enable_logs" {
  description = "Toggle flag for stdout container logging streams"
  type        = bool
  default     = true
}

# --- Collections ---
variable "container_names" {
  description = "List of naming seeds for deployment targeting"
  type        = list(string)
  default     = ["nginx-frontend", "nginx-proxy"]
}

variable "container_labels" {
  description = "Key-value metadata mapping for container filtering"
  type        = map(string)
  default = {
    Project   = "TerraWeek"
    ManagedBy = "Terraform"
  }
}

variable "unique_ports" {
  description = "Set of unique internal port configurations"
  type        = set(string)
  default     = ["80", "443"]
}

# --- Structural ---
variable "docker_settings" {
  description = "Complex structural representation of container specifications"
  type = object({
    image_name   = string
    restart_policy = string
    timeout      = number
  })
  default = {
    image_name   = "nginx:latest"
    restart_policy = "always"
    timeout      = 30
  }
}

variable "network_tuple" {
  description = "Fixed-element sequence representing network configs"
  type        = tuple([string, number, bool])
  default     = ["bridge", 1500, true]
}

# --- Sensitive & Dynamic Defaults ---
variable "db_secret_token" {
  description = "Sensitive access payload token example"
  type        = string
  sensitive   = true
  default     = "SuperSecureTWS2026Token"
}

# --- Bonus Point: Optional Attributes inside Object ---
variable "advanced_config" {
  description = "Complex structural config leveraging optional parameters"
  type = object({
    cpu_shares = optional(number, 1024)
    memory_mb  = optional(number, 512)
    privileged = optional(bool, false)
  })
  default = {}
}