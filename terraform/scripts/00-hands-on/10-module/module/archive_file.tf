locals {
  file_name = var.file_name == null ? "${random_string.file_name[0].result}" : "${var.file_name}"
}

resource "local_file" "file" {
  content  = var.file_content
  filename = "${local.file_name}.txt"
}

resource "random_string" "file_name" {
  count   = var.file_name == null ? 1 : 0
  length  = 10
  special = false
}

data "archive_file" "archive" {
  type        = "zip"
  source_file = local_file.file.filename
  output_path = "${local.file_name}.zip"
}
