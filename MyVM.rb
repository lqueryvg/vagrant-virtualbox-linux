# -*- mode: ruby -*-

module MyVM

    # this variable configures all of the following:
    # - the name of the VM in Virtualbox
    # - the hostname inside the VM
    # - the name according to Vagrant
    NAME = "centos7"
    UID = "2000"

    # localhost will listen on this port and forward to ssh in VM
    SSH_FORWARDED_PORT = "2200"
    SSH_PUBLIC_KEY = "~/.ssh/id_rsa.pub"

    BOX_NAME = "virtualbox-centos7"
    BOX_FILE = "file://" + ENV["HOME"] + "/packer/builds/" + BOX_NAME + ".box"
end

