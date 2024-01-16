module "archived_file" {
  source       = "../module"
  file_content = "File content one"
  file_name    = "file_one"
}

module "other_file" {
  source       = "../module"
  file_content = "Other file content"
}
