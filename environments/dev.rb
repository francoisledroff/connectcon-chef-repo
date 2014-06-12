name "dev"
description "Environment for dev nodes"
override_attributes({
  "cq5" => {"vault_accounts_cq_admin_item" => "dev_cq_admin" },
}) 



