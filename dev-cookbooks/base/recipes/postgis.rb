bash "install_geos" do
  not_if File.exists? "/usr/share/postgresql/9.2/extension/postgis.control"
  user "root"
  cwd "/tmp"
  code <<-EOH
    wget http://download.osgeo.org/geos/geos-#{node[:geos][:version]}.tar.bz2
    tar xvfj geos-#{node[:geos][:version]}.tar.bz2
    (cd geos-#{node[:geos][:version]}/ && ./configure && make && make install)
  EOH
end
bash "install_postgis" do
  not_if File.exists? "/usr/share/postgresql/9.2/extension/postgis.control"
  user "root"
  cwd "/tmp"
  code <<-EOH
    wget http://download.osgeo.org/postgis/source/postgis-#{node[:postgis][:version]}.tar.gz
    tar xfvz postgis-#{node[:postgis][:version]}.tar.gz
    (cd postgis-#{node[:geos][:version]}/ && ./configure && make && make install)
  EOH
end
