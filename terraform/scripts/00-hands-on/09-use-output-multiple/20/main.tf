provider "archive" {}

module "files" {
  source = "../10"
}

# data "archive_file" "archive" {
#  for_each    = module.files.output.file_names
##   type        = "zip"
# source_file = each.value
#  output_path = "${each.value}.zip"
# }

output "out" {
  value = module.files.file_names
}
