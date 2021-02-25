resource "google_service_account" "service_account" {
  account_id   = var.service_account.name
  project      = var.service_account.owner_project_id
  display_name = var.service_account.display_name
  description = var.service_account.description
}
module "sa_project_level_bind" {
    count = length(var.service_account.project_level_iam_bindings)
    counter = count.index
    email = google_service_account.service_account.email
    source = "./modules/sa_project_level_bind"
    service_account = var.service_account
}
module "sa_level_self_bind" {
    count = length(var.service_account.sa_level_self_iam_bindings)
    counter = count.index
    service_account_id = google_service_account.service_account.name
    source = "./modules/sa_level_self_bind"
    service_account = var.service_account
}