# -*- mode: ruby -*-
# vi: set ft=ruby :

# home_disk = 'home_disk.vdi'

require "./MyVM.rb"

Vagrant.configure("2") do |config|

  config.vm.define MyVM::NAME do |vb|
    vb.vm.hostname = MyVM::NAME
    vb.vm.network "forwarded_port", guest: 22, host: MyVM::SSH_FORWARDED_PORT
    vb.vm.box = MyVM::BOX_FILE

    config.vm.provider :virtualbox do |v|
      v.name = MyVM::NAME
      v.gui = false
      v.memory = 1024
      v.cpus = 2
      v.customize [ "storageattach", :id, "--storagectl", "IDE Controller",
        "--device", "0", "--port", "0", "--type", "dvddrive", "--medium", "emptydrive" ]
      # v.customize ['createhd', '--filename', home_disk, '--size', 20 * 1024]
      # v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', home_disk]
    end
  end

  # config.vm.synced_folder "file://" + ENV["HOME"], "/host_home", owner: "2000", group: "2000"
  config.vm.synced_folder ENV["HOME"], "/host_home", owner: MyVM::UID, group: MyVM::UID

  # Provisioning...

  config.vm.provision "file", source: MyVM::SSH_PUBLIC_KEY, destination: "/tmp/id_rsa.pub"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
  end

  config.vm.provision "shell", inline: "rm /tmp/id_rsa.pub"


end
