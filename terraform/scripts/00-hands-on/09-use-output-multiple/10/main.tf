provider "local" {}
provider "random" {}

terraform {
  required_providers {
    local = {
      version = "~> 1.4"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

locals {
  num_files = 4
}

resource "random_string" "file_id" {
  count   = local.num_files
  length  = 4
  special = false
}

resource "local_file" "hello" {
  count    = local.num_files
  content  = "Hello, Terraform"
  filename = "hello-${random_string.file_id[count.index].result}.txt"
}

output "file_names" {
  value = local_file.hello[*].filename
}
