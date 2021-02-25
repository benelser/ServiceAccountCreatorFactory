resource "google_service_account" "service_account" {
  account_id   = data.template_file.sa_definition.rendered.name
  project      = data.template_file.sa_definition.rendered.owner_project_id
  display_name = data.template_file.sa_definition.rendered.display_name
  description = data.template_file.sa_definition.rendered.description
}
module "sa_project_level_bind" {
    count = length(data.template_file.sa_definition.rendered.project_level_iam_bindings)
    counter = count.index
    email = google_service_account.service_account.email
    source = "./modules/sa_project_level_bind"
    service_account = data.template_file.sa_definition.rendered
}
module "sa_level_self_bind" {
    count = length(data.template_file.sa_definition.rendered.sa_level_self_iam_bindings)
    counter = count.index
    service_account_id = google_service_account.service_account.name
    source = "./modules/sa_level_self_bind"
    service_account = data.template_file.sa_definition.rendered
}