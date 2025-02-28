locals {
  infra_workspace_data = <<EOF
  {
    "data": {
      "type": "workspaces",
      "attributes": {
        "name": "infra",
        "description": "edfewr"
      },
      "relationships": {
        "project": {
          "data": {
            "id": "prj-123456",
            "type": "project"
          }
        }
      },
      "vars": {
        "data": [${local.json_payload} ]
      }
    }
  }
  EOF
}


output "infra_workspace_data" {
  value = local.infra_workspace_data
  
}