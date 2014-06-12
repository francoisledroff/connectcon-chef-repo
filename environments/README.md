Requires Chef 0.10.0+.

This directory is for Ruby DSL and JSON files for environments. For more information see the Chef wiki page:

http://wiki.opscode.com/display/chef/Environments

Here Our environments will :

* define cookbook versions 
* override the chef-vault encrypted data bags ids 
* override apache and cq dispatcher attributes 
* and many other cq and jvm runtime attributes:


A few usefull commands to manage these:

    knife environment from file dev.rb
    knife environment show dev



