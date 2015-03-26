# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.define "network" do |machine|
    machine.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
    end
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/getreqs.yml"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/prep.yml"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/deploy.yml"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/test.yml"
  end

end
