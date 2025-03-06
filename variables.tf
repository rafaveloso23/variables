variable "vars" {
  type = any
  default = {
    string_example = "hello"
    create_storage_account = true
    teste = 2
  }
}

locals {
  json_convert = jsonencode(var.vars)
}

# output "locals_json_convert" {
#   value = local.json_convert
# }

output "infra_workspace_data" {
  value = local.infra_workspace_data.data.relationships.vars.data
}
