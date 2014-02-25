bash "mirror_config" do
  not_if { File.exists? "/home/vagrant/.gitignore" }
  user "vagrant"
  cwd "/vagrant/user-config"
  code <<-EOH
    cp -rf ./ /home/vagrant
    chmod 400 /home/vagrant/.ssh/id_rsa*
    mkdir /home/vagrant/config_files
  EOH
end
git "/home/vagrant/config_files" do
  repository node[:config_repo]
  reference "master"
  action :sync
end
bash "config_db_installation" do
  not_if { File.exists? "/home/vagrant/.vimrc" }
  user "vagrant"
  cwd "/home/vagrant/config_files"
  code <<-EOH
    cp -f /home/vagrant/config_files/.* /home/vagrant/
  EOH
end
