 apt_repository "postgresql" do
   uri "http://ppa.launchpad.net/pitti/postgresql/ubuntu"
   keyserver "keyserver.ubuntu.com"
   key "8683D8A2"
   components ["precise", "main"]
 end
 
 package 'vim'
include_recipe "postgresql::server"
include_recipe "postgresql::contrib"
include_recipe 'postgis'
