locals {
  intra_workspace_data = jsondecode(jsonencode({
    data = {
      type       = "workspaces"
      attributes = {
        name        = "test_workspace"
        description = "Test workspace"
      }
      relationships = {
        project = {
          data = {
            id   = "project_id"
            type = "project"
          }
        }
        vars = {
          data = [
            for k, v in var.vars : {
              type = "vars"
              attributes = {
                key       = k
                value     = try(jsonencode(v), v)  # Ensures HCL values are encoded properly
                category  = "terraform"
                sensitive = false
                hcl       = true  # Allows the user to pass HCL values from the API
              }
            }
          ]
        }
      }
    }
  }))
}

output "intra_workspace_data" {
  value = local.intra_workspace_data
}
