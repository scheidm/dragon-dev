package 'libxml2-dev'
package 'libproj-dev'
package 'libjson0-dev'
package 'xsltproc'
package 'docbook-xsl'
package 'docbook-mathml'
package 'libgdal1-dev'
package 'postgresql-contrib-9.2'
package 'build-essential'
package 'postgresql-server-dev-9.2'

bash "install_postgis" do
  not_if File.exists? "/usr/share/postgresql/9.2/extension/postgis.control"
  user "root"
  cwd "/tmp"
  notifies :run, "bash[unpack_geos_source]", :delayed
  notifies :run, "bash[configure_geos]", :delayed
  notifies :run, "bash[make_geos]", :delayed
  notifies :run, "bash[make_install_geos]", :delayed
  notifies :run, "bash[unpack_postgis_source]", :delayed
  notifies :run, "bash[configure_postgis]", :delayed
  notifies :run, "bash[make_install_postgis]", :delayed
end

bash "unpack_geos_source" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    wget http://download.osgeo.org/geos/geos-#{node[:geos][:version]}.tar.bz2 
    tar xvfj geos-#{node[:geos][:version]}.tar.bz2
  EOH
  action :nothing
end

bash "configure_geos" do
  user "root"
  cwd "/tmp/geos-#{node[:geos][:version]}"
  code <<-EOH
    ./configure >> geos.log
  EOH
  action :nothing
end

bash "make_geos" do
  user "root"
  cwd "/tmp/geos-#{node[:geos][:version]}"
  code <<-EOH
    make >> geos.log
  EOH
  action :nothing
end

bash "make_install_geos" do
  user "root"
  cwd "/tmp/geos-#{node[:geos][:version]}"
  code <<-EOH
    make install >> geos.log
  EOH
  action :nothing
end

bash "unpack_postgis_source" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    wget http://download.osgeo.org/postgis/source/postgis-#{node[:postgis][:version]}.tar.gz
    tar xfvz postgis-#{node[:postgis][:version]}.tar.gz
  EOH
  action :nothing
end

bash "configure_postgis" do
  user "root"
  cwd "/tmp/postgis-#{node[:postgis][:version]}"
  code <<-EOH
    ./configure >> postgis.log
  EOH
  action :nothing
end

bash "make_postgis" do
  user "root"
  cwd "/tmp/postgis-#{node[:postgis][:version]}"
  code <<-EOH
   make >> postgis.log
  EOH
  action :nothing
end

bash "make_install_postgis" do
  user "root"
  cwd "/tmp/postgis-#{node[:postgis][:version]}"
  code <<-EOH
    make install >> postgis.log
  EOH
  action :nothing
end
