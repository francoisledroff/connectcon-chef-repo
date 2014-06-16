name "dev"
description "Environment for dev nodes"
override_attributes({
  "artifact_repo_url" => "http://bsi-nexus.corp.adobe.com:8080/nexus/content/repositories/hub-releases/",  
  "dev_mode" => "true", #chef-vault-util dev mode will use plain data_bags and not encrypted
  "cq5" => {"vault_accounts_cq_admin_item" => "dev_cq_admin" },
}) 



