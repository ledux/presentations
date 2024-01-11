provider "archive" {}

module "files" {
  source = "../10"
}

data "archive_file" "archive" {
  type        = "zip"
  source_file = module.files.file_name
  output_path = "${module.files.file_name}.zip"
}

