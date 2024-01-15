provider "random" {}

terraform {
  required_providers {
    local = {}
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
  backend "local" {
    path = ".terraform/terraform.tfstate"
  }
}

resource "random_string" "file_id" {
  length  = 4
  special = false
}

output "file_id" {
  value = random_string.file_id.result
}
