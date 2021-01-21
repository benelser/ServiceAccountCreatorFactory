resource "google_organization_iam_member" "organization" {
  count = length(var.service_account.org_level_iam_bindings[var.counter].org_level_roles)
  org_id = var.service_account.org_level_iam_bindings[var.counter].org_id
  role    = var.service_account.org_level_iam_bindings[var.counter].org_level_roles[count.index]
  member  = "serviceAccount:${var.email}"
}