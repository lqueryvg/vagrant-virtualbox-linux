# -*- mode: ruby -*-
# vi: set ft=ruby :


# start with config defaults, then merge user settings on top
conf = {
  vm_name: Config.vars[:box_name],
  box_file: "file://" + ENV["HOME"] + "/packer/output/virtualbox-" + Config.vars[:box_name] + ".box",
  user_name: ENV["USER"]
}
conf.merge!(Config.vars)  # merge user settings on top


Vagrant.configure("2") do |config|

  config.vm.define conf[:vm_name] do |vb|
    vb.vm.hostname = conf[:vm_name]
    vb.vm.network "forwarded_port", guest: 22, host: conf[:ssh_forwarded_port]
    vb.vm.box = conf[:box_file]
    
    config.vm.provider :virtualbox do |v|
      v.name = Config::vars[:vm_name]
      v.gui = false
      v.memory = Config::vars[:memory]
      v.cpus = Config::vars[:cpus]
      v.customize [ "storageattach", :id, "--storagectl", "IDE Controller",
        "--device", "0", "--port", "0", "--type", "dvddrive", "--medium", "emptydrive" ]
      
      # This is how you might be to provision an extra disk...
      # home_disk = 'home_disk.vdi'
      # v.customize ['createhd', '--filename', home_disk, '--size', 20 * 1024]
      # v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', home_disk]
    end
  end

  config.vm.synced_folder ENV["HOME"], "/host_home", owner: conf[:uid], group: conf[:uid]

  # Provisioning...

  conf[:temp_key_file] = "/tmp/id_rsa.pub"
  config.vm.provision "file", source: conf[:ssh_public_key], destination: conf[:temp_key_file]
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "src/provision/ansible/playbook.yml"
    ansible.extra_vars = conf
  end

  config.vm.provision "shell", inline: "rm " + conf[:temp_key_file]
end

require 'json'
puts "provisioning config = " + JSON.pretty_generate(JSON.parse(conf.to_json))