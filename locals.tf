variable "test" {
  type = list(object({
    ambiente                = string
    criar_storage_account   = bool
    app                     = string
    resources_string_name   = string
    bo                      = string
    centro_custo            = string
    componente              = string
    departamento            = string
    dominio                 = string
    empresa                 = string
    gerenciamento           = string
    provedor                = string
    to                      = string
  }))

  default = [
    {
      ambiente                = "default"
      criar_storage_account   = false
      app                     = "default-app"
      resources_string_name   = "default-resource"
      bo                      = "default-bo"
      centro_custo            = "default-centro-custo"
      componente              = "default-componente"
      departamento            = "default-departamento"
      dominio                 = "default-dominio"
      empresa                 = "default-empresa"
      gerenciamento           = "default-gerenciamento"
      provedor                = "default-provedor"
      to                      = "default-to"
    }
  ]
}

locals {
  vars_data = flatten([
    for obj in var.test : [
      for key in keys(obj) : {
        type = "vars"
        attributes = {
          key       = key
          value     = tostring(obj[key])
          category  = "terraform"
          sensitive = false
        }
      }
    ]
  ])
}

output "vars_data" {
  value = local.vars_data
  
}
 
output "json_payload" {
  value = jsonencode({
    vars = {
      data = local.vars_data
    }
  })
}