  # -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |v|
	  v.name = "python-vm"
	  v.memory = 2048
	  v.cpus = 2
  end

  config.vm.network "forwarded_port", guest: 80, host: 7080
  config.vm.network "forwarded_port", guest: 5672, host: 5672
  config.vm.network "forwarded_port", guest: 15672, host: 15672

  config.vm.synced_folder "#{ENV['HOME']}/.ssh",
      "/home/vagrant/copy-ssh",
      id: "copy-ssh",
      owner: "ubuntu",
      group: "ubuntu",
      mount_options: ["dmode=700,fmode=600"]

  config.vm.synced_folder "#{ENV['GITHUB']}/ansible-roles",
      "/home/vagrant/ansible-roles",
      id: "ansible-roles",
      owner: "ubuntu",
      group: "ubuntu",
      mount_options: ["dmode=777,fmode=777"]

  config.vm.synced_folder "#{ENV['GITHUB']}/python-vm-projects",
      "/home/vagrant/projects",
      id: "projects",
      owner: "ubuntu",
      group: "ubuntu",
      mount_options: ["dmode=755,fmode=755"]

  config.vm.synced_folder "#{ENV['GITLAB']}/workflow/apps",
	  "/home/vagrant/apps",
	  id: "apps",
      owner: "ubuntu",
      group: "ubuntu",
      mount_options: ["dmode=755,fmode=755"]

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provision.yml"
  end
end
