# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 5678, host: 5678

  config.vm.synced_folder "C:/Users/#{ENV['USERNAME']}/.ssh", "/home/ubuntu/copy-ssh", id: "copy-ssh",
      owner: "ubuntu",
      group: "ubuntu",
      mount_options: ["dmode=700,fmode=600"]

  config.vm.synced_folder "C:/Users/#{ENV['USERNAME']}/projects/python-vm-projects", "/home/ubuntu/projects", id: "projects",
      owner: "ubuntu",
      group: "ubuntu",
      mount_options: ["dmode=700,fmode=600"]

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provision.yml"
  end
end
