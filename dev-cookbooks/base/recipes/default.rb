 package 'vim'
directory "#{node['postgresql']['dir']}" do
  recursive true
  action :create
end

apt_repository "postgresql-9.2" do
  uri "http://ppa.launchpad.net/pitti/postgresql/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  key "8683D8A2"
  keyserver "keyserver.ubuntu.com"
  notifies :run, resources(:execute => "apt-get update"), :immediately
end
