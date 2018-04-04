# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
# home_disk = 'home_disk.vdi'

require 'yaml'

puts 'hello'

current_dir    = File.dirname(File.expand_path(__FILE__))
config         = YAML.load_file("#{current_dir}/config.yaml")

# puts config
# puts config["vm_hostname"]

# host_name: = "centos7"
host_name = config["vm_hostname"]
ssh_forwarded_port = config["ssh_forwarded_port"]
box_name = config["box_name"]
ssh_public_key = config["ssh_public_key"]
# puts host_name


Vagrant.configure("2") do |config|

  # config.vm.define "centos7" do |vb|
  # host_name = config["vm_hostname"]
  # puts host_name
  # puts vm_hostname
  # vm_hostname = "centos7"
  config.vm.define host_name do |vb|
    vb.vm.hostname = host_name
  # config.vm.define "john" do |vb|
  #   vb.vm.hostname = config["vm_hostname"]
    vb.vm.network "forwarded_port", guest: 22, host: 2200
    vb.vm.box = "file://" + ENV["HOME"] + "/packer/builds/virtualbox-centos7.box"
    vb.vm.box = "virtualbox-centos7"
    # vb.vm.box = "file://" + ENV["HOME"] + "/packer/builds/wibble.box"

    config.vm.provider :virtualbox do |v|
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
  config.vm.synced_folder ENV["HOME"], "/host_home", owner: "2000", group: "2000"



  # Provisioning...

  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/id_rsa.pub"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
  end

  config.vm.provision "shell", inline: "rm /tmp/id_rsa.pub"


end
