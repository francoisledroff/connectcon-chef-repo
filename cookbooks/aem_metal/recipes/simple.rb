require 'chef_metal'

machine 'aemsimple' do
  tag 'aemsimple'
  recipe 'apache2'
  chef_environment 'dev'
  converge true
  complete true
  # https://github.com/opscode/chef-metal/issues/95
  add_machine_options :vagrant_config => <<-EOM
            config.vm.network "private_network", ip: "192.168.0.21"
          EOM
end
