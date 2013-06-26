apt_repository "postgresql" do
  uri "http://ppa.launchpad.net/pitti/postgresql/ubuntu"
  keyserver "keyserver.ubuntu.com"
  key "8683D8A2"
  components ["precise", "main"]
end
