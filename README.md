# Service Account Creator Factory 
This module is used to create and manage the full life-cycle of service accounts from terraform. The assumption is that you will be creating service accounts in a "owner-project" then granting each service account permissions to other projects to include its owner project if you choose by defining a new binding "object" {} in json property "project_level_iam_bindings" which is an array that holds our "binding objects" {}. 

### Example of Service Account roles in which I want to apply at a project level

```json
{
    "project_id": "product1-prod-b9f3",
    "project_level_roles": [
        "roles/accessapproval.approver",
        "roles/aiplatform.viewer"
    ]
}

```

## Granting other identities access to the Service Account Resource
Remember, a service account is a identity and a resource. Above we created the SA as a resource and granted permissions to that resource. As an identity we need to define new policies to declare WHO has permissions to ACTAS that service account "AS AN IDENTITY".

### Example of defining WHO can ACTAS the Service Account

```json
"sa_level_self_iam_bindings": [
    {
    "role": "roles/iam.serviceAccountUser",
    "members": [
        "user:belser@elsersmusings.com",
        "user:amanda.elser@elsersmusings.com"
    ]
    },
    {
    "role": "roles/iam.serviceAccountAdmin",
    "members": [
        "user:belser@elsersmusings.com",
        "user:amanda.elser@elsersmusings.com"
    ]
    }
]
```

## Instantiate sa_creator_factory
```bash
locals {
  raw_json = file("${path.module}/service_accounts.json")
  json = jsondecode(local.raw_json) # Serialize our json to terraform object
}

module "sa_creator_factory" {
    count = length(local.json)
    prefix = "elser-"
    source = "./modules/sa_creator_factory"
    service_account = local.json[count.index]
}
```