# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'fileutils'

def local_cache(basebox_name)
  cache_dir = Vagrant::Environment.new.home_path.join('cache', 'apt', basebox_name)
  partial_dir = cache_dir.join('partial')
  FileUtils.mkpath partial_dir unless partial_dir.exist?
  cache_dir
end

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder local_cache(config.vm.box), "/var/cache/apt/archives/"

  config.vm.define "network" do |machine|
    machine.vm.network :private_network, ip: "10.1.0.2",
                       :netmask => "255.255.0.0"
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
