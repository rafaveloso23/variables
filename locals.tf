
locals {
  vars_data = [
    for key, value in var.vars : {
      type = "vars"
      attributes = {
        key       = key
        value     = tostring(value)
        category  = "terraform"
        sensitive = false
        hcl       = true
      }
    }
  ]
}

locals {
  json_payload = jsonencode({
    relationships = {
      vars = {
        data = local.vars_data
      }
    }
  })
}

output "vars_data_only" {
  value = local.vars_data
}

output "json_payload" {
  value = local.json_payload
}

output "vars_data" {
  value = local.vars_data
}
