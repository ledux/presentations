provider "local" {
}

terraform {
  required_providers {
    local = {
      version = "~> 1.4"
    }
  }
}

resource "local_file" "hello" {
  content  = "Hello, Terraform"
  filename = "hello.txt"
}

resource "local_file" "hello-two" {
  content  = "Hello, Terraform"
  filename = "hello-2.txt"
}
