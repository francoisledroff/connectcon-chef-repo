require 'chef_metal'

machine 'author' do
  tag 'author'
  recipe 'aem::author'
  chef_environment 'dev'
  converge true
  complete true
  # https://github.com/opscode/chef-metal/issues/95
  add_machine_options :vagrant_config => <<-EOM
      config.vm.network "private_network", ip: "192.168.0.20"
      config.vm.provider 'virtualbox' do |v|
             v.customize [
               "modifyvm", :id,
               "--memory", "4096"
             ]
      end   
      EOM
end
