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

variable "file_count" {
  type        = number
  description = "How many files to be created"
}

resource "random_string" "file_id" {
  count   = var.file_count
  length  = 4
  special = false
}

resource "local_file" "hello" {
  count    = var.file_count
  content  = "Hello, Terraform"
  filename = "hello-${random_string.file_id[count.index].result}.txt"
}
