Run local vm
==========

using https://github.com/opscode/chef-metal

Install all the required ruby gem:

	$ bundle install

to use all your berkshelf dependencies

	$ berks vendor

This will place all your cookbooks dependencies under this repo `berks-cookbook` folder, (this folder is referenced in the chef-zero run)
	
then		
	
	export CHEF_DRIVER=vagrant
	chef-client -z -o aem_metal

to destroy it

	chef-client -z destroy_all.rb
	
assign the vm an IP

	~/workspace/gitcorp/hub-chef-repo/local/.chef/vms on ⭠ develop! ⌚ 13:43:53
	$ cat hub-trunk.vm 
	Vagrant.configure('2') do |outer_config|
	  outer_config.vm.define "hub-trunk" do |config|
	    config.vm.box = "CentOS-6.4-x86_64"
	    config.vm.hostname = "hub-trunk"
	    config.vm.network "private_network", ip: "192.168.50.4"
	  end
	end

troubleshooting
------

### 1

	STDERR:/Users/ledroff/.vagrant.d/gems/gems/vagrant-berkshelf-1.3.7/lib/berkshelf/vagrant/env.rb:18:in `initialize': undefined method `scope' for #<Vagrant::UI::Colored:0x000001026c2908> (NoMethodError)
	
	
uninstalled 

vagrant plugin uninstall vagrant-berkshelf

### 2

The plugins failed to load properly. The error message given is
    shown below.
    
    undefined method `register_middleware' for #<Faraday::Connection:0x0000010221f018>
    ---- End output of vagrant box add CentOS-6.4-x86_64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box ----
    
a few hints found here: 

* https://coderwall.com/p/qppt2q
* https://github.com/mitchellh/vagrant/issues/3128

	vagrant plugin uninstall vagrant-chef-zero
	 
