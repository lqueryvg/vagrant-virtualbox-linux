# -*- mode: ruby -*-

Config.vars = {
  # offline_testing:          "true",    # set to anything when testing offline (skips certain provisioning steps)

  box_name:   "centos72-7511",    # mandatory
  # vm_name:  "fred",             # defaults to {box_name} if not set
  # box_file:  "/tmp/jim.box",    # defaults to $HOME/virtualbox-{box_name}.box

  # user_name:            "fred",                 # defaults to $USER on Windows
  # uid:                  "1234",                 # default = 1000
  # ssh_forwarded_port:   "1234",                 # default = 2200, must be unique on the Virtualbox host
                                                  # this port forwards to ssh port 22 inside the VM
  # ssh_public_key:       "~/.ssh/id_rsa.pub",    # this is the default

  # memory:           "512",       # default = 1024 MiB
  # cpus:             "1",         # default = 2

  # locale:           "en_GB.utf8",     # en_US.UTF-8 for friends in the US
  # timezone:         "Europe/London",
  # keyboard_type:    "uk",
}

