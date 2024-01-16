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
  length  = 4
  special = false
}

resource "local_file" "hello" {
  content  = "Hello, Terraform"
  filename = "${terraform.workspace}/hello-${random_string.file_id.result}.txt"
}
