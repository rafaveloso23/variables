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
  json_payload = jsonencode(local.vars_data)
}

locals {
  intra_workspace_data = <<EOF
{
    "data": {
        "type": "workspaces",
        "attributes": {
            "name": "tetse",
            "description": "teste"
        },
        "relationships": {
            "project": {
                "data": {
                    "id": "testes",
                    "type": "project"
                }
            },
            "vars": {
                "data": [${local.json_payload}]
            }
        }
    }
}
EOF 
}

output "intra_workspace_data" {
  value = local.intra_workspace_data
  
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
