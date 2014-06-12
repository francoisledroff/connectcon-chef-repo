name "prod"
description "Environment for prod nodes"
#TODO freeze the version for prod
override_attributes({
  "cq5" => {"vault_accounts_cq_admin_item" => "prod_cq_admin" },
}) 



