name "stage"
description "Environment for stage nodes"
#TODO freeze the version for stage
override_attributes({
  "cq5" => {"vault_accounts_cq_admin_item" => "stage_cq_admin" },
}) 



