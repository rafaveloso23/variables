variable "vars" {
  type = map(any)
  default = {
    string_example = "hello"
    create_storage_account = true
    teste = 2
  }
}

locals {
  json_convert = jsonencode(var.vars)
}

output "locals_json_convert" {
  value = local.json_convert
}