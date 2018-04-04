# Usage

    box=virtualbox-centos7
    (cd $HOME/packer/builds; vagrant box add -f $box ${box}.box)
    vagrant up

# Re-run ansible

    vagrant provision

# Directory structure


# TODO
- move vars into yaml file (for vm)
- create vars in centos7.json (packer)
- move directory structure into this README
- remove doit.sh
- use Makefile