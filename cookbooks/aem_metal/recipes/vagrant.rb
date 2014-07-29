require 'cheffish'
require 'chef_metal_vagrant'

repo_path = ENV['AEM_CHEF_REPO']
vms_dir = File.join(repo_path, 'vagrant_vms')

with_chef_local_server :chef_repo_path => repo_path,
  :cookbook_path => [ File.join(repo_path, 'cookbooks'),
    File.join(repo_path, 'berks-cookbooks') ]

vagrant_box 'CentOS-6.4-x86_64' do
  url 'http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box'
end

with_machine_options :vagrant_options => {
  'vm.box' => 'CentOS-6.4-x86_64'
}


with_chef_environment 'trunk'


