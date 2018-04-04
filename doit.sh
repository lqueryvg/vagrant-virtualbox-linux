box=virtualbox-centos7
(cd $HOME/packer/builds; vagrant box add -f $box ${box}.box)
vagrant up
