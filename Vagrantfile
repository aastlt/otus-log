# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

#  config.vm.provision "ansible" do |ansible|
#    ansible.verbose = "vvv"
#    ansible.playbook = "playbook.yml"
#    ansible.become = "true"
#  end

  config.vm.provider "libvirt" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.define "log" do |log|
    log.vm.network "private_network", ip: "192.168.50.15", virtualbox__intnet: "net1"
    log.vm.hostname = "log"
    log.vm.provision "shell", path: "log_script.sh"
  end

  config.vm.define "web" do |web|
    web.vm.network "private_network", ip: "192.168.50.10", virtualbox__intnet: "net1"
    web.vm.hostname = "web"
    web.vm.provision "shell", path: "web_script.sh"
  end
  
#  config.vm.define "elk" do |elk|
#    elk.vm.network "private_network", ip: "192.168.50.12", virtualbox__intnet: "net1"
#    elk.vm.hostname = "elk"
#    elk.vm.provision "shell", path: "nfsc_script.sh"
#  end

end

