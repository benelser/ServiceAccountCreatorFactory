# variable "service_account" {
#     type = object({
#         name = string
#         owner_project_id = string
#         display_name = string
#         description = string
#         project_level_iam_bindings = list(
#             object({
#                 project_id = string
#                 project_level_roles = list(string)
#             })
#         )
#         sa_level_self_iam_bindings = list(
#             object({
#                 role = string
#                 members = list(string)
#         }))
#     })
# }

variable "service_account_file_name" {
    type = string
}

variable "project_id" {
    type = string
}

variable "environment" {
    type = string
}