provider "local" {}

data "terraform_remote_state" "local" {
  backend = "local"

  config = {
    path = "${path.module}/../10/.terraform/terraform.tfstate"
  }
}

resource "local_file" "hello" {
  content  = "Hello, Terraform"
  filename = "hello-${data.terraform_remote_state.local.outputs.file_id}.txt"
}

