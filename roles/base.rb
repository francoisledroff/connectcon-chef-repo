name "base"
description "connectcon base server role"
run_list "recipe[chef-client::delete_validation]", "recipe[ntp]"
