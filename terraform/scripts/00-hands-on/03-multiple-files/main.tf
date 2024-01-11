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

resource "random_string" "file_id" {
  count   = 4
  length  = 4
  special = false
}

resource "local_file" "hello" {
  count    = 4
  content  = "Hello, Terraform"
  filename = "hello-${random_string.file_id[count.index].result}.txt"
}
