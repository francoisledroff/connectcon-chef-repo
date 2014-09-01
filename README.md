ConnectCon Conf Chef repository
====================

Every Chef Organization needs a Chef Repository.
This is the place where cookbooks, roles, config files and other artifacts for managing systems with Chef live. This repository was made to run a Chef organization to demo our aem/cq cookbook at the ConnectCon conference, cf.

* http://www.connectcon.ch/2014/en/speakers2/francois-le-droff.html
* http://www.slideshare.net/francoisledroff/master-chef-class-learn-how-to-quickly-cook-delightful-cqaem-infrastructures


AEM Chef Test-Drive
-------------------

Later on I added a [chef-metal](https://github.com/opscode/chef-metal) based cookbook in this chef repo, this allows you to have   an AEM infra fully configured in matter of minutes using a vagrant provisionner. 

* install [vagrant](https://www.vagrantup.com/downloads)
* install ruby with [rvm](https://rvm.io/)
* install [bundler](http://bundler.io/)
* checkout this git [chef-repo](https://github.com/francoisledroff/connectcon-chef-repo) to your disk
* edit the [dev.json](https://github.com/francoisledroff/connectcon-chef-repo/blob/master/environments/dev.json#L11) environment file in order to have the `download_url` and `license_url` pointing to reachable aem jar and license URLs within your network 
* change directory to the root of the local copy of this git repo
* launch our ./local_setup.sh


Except for vagrant installation all the above can be boiled down to the following commmand lines:

	curl -sSL https://get.rvm.io | bash -s stable
	gem install bundler
	git clone https://github.com/francoisledroff/connectcon-chef-repo.git
	cd connectcon-chef-repo
	./local_first_usecase.sh
	
A few minutes later you will have a centos vm running on a local IP ([set up in our aem-metal default recipe](https://github.com/francoisledroff/connectcon-chef-repo/blob/master/cookbooks/aem_metal/recipes/author.rb#L11)) If this [private range IP](http://en.wikipedia.org/wiki/Private_network) is in used pick another one, just change the recipe file.

The vm is created by default under `.chef/vms` . From there, you can ssh in, and then double check aem service is started and eventually stop the firewall to freely access this chef automated cq author instance from your browser at [http://192.168.0.20:4502](http://192.168.0.20:4502)  

	$ cd .chef/vms	
	$ vagrant ssh
	Last login: Tue Jul 15 16:44:19 2014 from 10.0.2.2
	Welcome to your Vagrant-built virtual machine.
	[vagrant@author ~]$ sudo service service aem-author status 
	[vagrant@author ~]$ sudo service iptables stop
	
	

What's next ?
------------

If my agenda allows it, I hope I could demo here as well:

* how this vagrant provisioner could be replaced by a [docker provisioner](https://github.com/opscode/chef-metal-docker) or a  [EC2, Rackspace, DigitalOcean and Openstack provisioner](https://github.com/opscode/chef-metal-fog) 
* how to secure the automation with [chef-vault](https://github.com/Nordstrom/chef-vault)
* how to set up a few typical aem infrastructures (more complex than just this author instance I have for now) as presented in [my slides](http://www.slideshare.net/francoisledroff/master-chef-class-learn-how-to-quickly-cook-delightful-cqaem-infrastructures)


troubleshooting
------

### failing vagrant #1 

issue:

	STDERR:/Users/ledroff/.vagrant.d/gems/gems/vagrant-berkshelf-1.3.7/lib/berkshelf/vagrant/env.rb:18:in `initialize': undefined method `scope' for #<Vagrant::UI::Colored:0x000001026c2908> (NoMethodError)
	
	
solution: 

	vagrant plugin uninstall vagrant-berkshelf

### failing vagrant #2


issue:
    
    undefined method `register_middleware' for #<Faraday::Connection:0x0000010221f018>
    ---- End output of vagrant box add CentOS-6.4-x86_64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box ----
    
solution:

	vagrant plugin uninstall vagrant-chef-zero
	
cf. 

* https://coderwall.com/p/qppt2q
* https://github.com/mitchellh/vagrant/issues/3128
	 



