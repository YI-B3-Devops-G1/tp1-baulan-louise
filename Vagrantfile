Vagrant.require_version ">= 1.3.5"

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"

  config.vm.network "forwarded_port", guest: 80, host: 8001, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 22, host: 2223, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 443, host: 4444, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "DevOpsVagrant"
    vb.gui = true 
    vb.memory = "1024"
  end  

  config.vm.provision :shell, path: "bootstrap.sh"
end