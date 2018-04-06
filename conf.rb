# -*- mode: ruby -*-

Config.vars = {
  # offline_testing:          "true",    # set this to anything when testing offline to skip certain provisioning steps

  # box_name:   "centos72-72-1511",
  # this maps to 
  box_name:   "centos72-7511",
  
  # vm_name:  "fred",             # defaults to {box_name} if not set
  # box_file:  "/tmp/jim.box",    # defaults to $HOME/packer/output/virtualbox-{box_name}.box

  vm_name:    "argh",
  memory:     "1024",
  cpus:       "2",

  locale:           "en_GB.utf8",     # en_US.UTF-8 for friends in the US
  timezone:         "Europe/London"
  keyboard_type:    "uk",

  user_name:        "john",       # defaults to $USER on Windows
  uid:              "1001",

  # localhost will listen on this port and forward to ssh inside the VM
  ssh_forwarded_port:   "2400",     # must be unique on the host running Virtualbox
  ssh_public_key:       "~/.ssh/id_rsa.pub",

}

