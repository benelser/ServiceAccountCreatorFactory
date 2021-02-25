data "template_file" "sa_definition" {
  template = "${file("${path.root}/serviceaccounts/${var.service_account_file_name}")}"
  vars = {
    project_id = "${var.project_id}"
    environment = "${var.environment}"
  }
}