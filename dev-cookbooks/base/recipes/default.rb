apt_repository "postgresql" do
  uri "http://ppa.launchpad.net/pitti/postgresql/ubuntu"
  keyserver "keyserver.ubuntu.com"
  key "8683D8A2"
  components ["precise", "main"]
end
 
 package 'vim'
directory '/etc/postgresql/9.2/main' do
  recursive true
end

include_recipe "postgresql::server"
include_recipe "postgresql::contrib"
