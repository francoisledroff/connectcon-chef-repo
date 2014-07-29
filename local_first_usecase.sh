bundle install
rm Berksfile.lock
rm -rf berks-cookbooks
berks vendor
export CHEF_DRIVER=vagrant
export AEM_CHEF_REPO=$(pwd)
chef-client -z -o  aem_metal   

# to destroy your vm and chef assocaited node and client:
#chef-client -z cookbooks/aem_metal/recipes/destroy_all.rb 

