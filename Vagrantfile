# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.define "python_vm" do |machine|
    machine.vm.network "forwarded_port", guest: 8000, host: 8100,  host_ip: "127.0.0.1"
    machine.vm.network "forwarded_port", guest: 80, host: 8080,  host_ip: "127.0.0.1"
    machine.vm.network "forwarded_port", guest: 443, host: 8443,  host_ip: "127.0.0.1"

    machine.vm.synced_folder "/Users/john/projects/", "/home/ubuntu/projects", create: true

    machine.vm.provider "virtualbox" do |vb|
      vb.name = "python-vm"
      vb.memory = "1024"
    end

    machine.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "provision.yml"
      ansible.inventory_path = "inventory"
    end
  end
end
