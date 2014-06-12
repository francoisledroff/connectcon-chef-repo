ConnectCon Conf Chef repository
====================

Every Chef Organization needs a Chef Repository.
This is the place where cookbooks, roles, config files and other artifacts for managing systems with Chef live.

This repository was made to run a Chef organization to demo our aem/cq cookbook at the Connect Com conference
cf. http://www.connectcon.ch/2014/en/speakers2/francois-le-droff.html

roles
-------

### base

This will the base/common role for all the server under our connectcon organization with the following run list

	run_list "recipe[chef-client::delete_validation]", "recipe[ntp]"

to upload any modification you make to the role 

    knife role from file base.rb	

environments
-----------

Our environments will allow you to:

* define cookbook versions 
* override the chef-vault encrypted data bags ids (such as `vault_accounts_cq_admin_item` )
* override apache and cq dispatcher attributes 
* and many other cq and jvm runtime attributes:


A few useful commands to manage these:

    knife environment from file dev.rb
    knife environment from file stage.rb
    knife environment from file prod.rb


