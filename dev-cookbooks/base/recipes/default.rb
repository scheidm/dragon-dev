apt_repository "postgresql" do
  uri "http://ppa.launchpad.net/pitti/postgresql/ubuntu"
  keyserver "keyserver.ubuntu.com"
  key "8683D8A2"
  components ["precise", "main"]
end
 
package 'vim'
package 'build-essential'
package 'postgresql-9.2'
package 'postgresql-server-dev-9.2'
package 'libxml2-dev'
package 'libproj-dev'
package 'libjson0-dev'
package 'xsltproc'
package 'docbook-xsl'
package 'docbook-mathml'
package 'libgdal1-dev'
package 'postgresql-contrib-9.2'
package 'git'



