bash "mirror_config" do
  not_if { File.exists? "/home/vagrant/.gitignore" }
  user "vagrant"
  cwd "/home/vagrant"
  code <<-EOH
    cp -rf /vagrant/user-config/* /home/vagrant
  EOH
end
bash "config_files" do
  only_if { node.attribute?("config_repo") }
  user "root"
  cwd "/tmp"
  notifies :run, "bash[config_repo]", :immediately
end
bash "config_repo" do
  not_if { File.exists? "/home/vagrant/.git" }
  user "vagrant"
  cwd "/home/vagrant"
  code <<-EOH
    git init .
    git remote add -t \* -f origin #{node[:config_repo]}
    git pull origin master
    git clone https://github.com/gmarik/vundle.git /home/vagrant/.vim/bundle/vundle
  EOH
end

  
