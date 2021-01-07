variable "service_account" {
    type = object({
        name = string
        owner_project_id = string
        project_level_iam_bindings = list(
            object({
                project_id = string
                project_level_roles = list(string)
            })
        )
        sa_level_self_iam_bindings = list(
            object({
                role = string
                members = list(string)
        }))
    })
}

variable "counter" {
    type = number
}

variable "service_account_id" {
    type = string
}