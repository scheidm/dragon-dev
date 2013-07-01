bash "user set-up" do
  not_if File.exists? "/home/vagrant/Vagrantfile"
  user "root"
  code <<-EOH
    ln -s /vagrant /home/vagrant/
    cp /vagrant/user-config/* /home/vagrant
  EOH
  action :nothing
end
