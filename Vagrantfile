# -*- mode: ruby -*-
# vi: set ft=ruby :


ENV['VAGRANT_NO_PARALLEL'] = 'yes'
#VAGRANT_BOX         = "generic/ubuntu2004"
#VAGRANT_BOX_VERSION = "4.2.16"
VAGRANT_BOX         = "almalinux/9"
VAGRANT_BOX_VERSION = "9.0.20221102"
CPUS_MASTER_NODE    = 3
CPUS_WORKER_NODE    = 2
MEMORY_MASTER_NODE  = 2048
MEMORY_WORKER_NODE  = 1536
WORKER_NODES        = 2

Vagrant.configure(2) do |config|

  config.vm.box_download_insecure=true
  config.vm.provision "shell", path: "bootstrap.sh"  

  # Kubernetes Master Node
  config.vm.define "kmaster1" do |node|
  
    node.vm.box               = VAGRANT_BOX
    node.vm.box_version       = VAGRANT_BOX_VERSION
    node.vm.box_check_update  = false
    node.vm.hostname          = "kmaster1"

    # Set static IP
    node.vm.network "private_network", ip: "172.18.18.100"
  
    node.vm.provider "virtualbox" do |v|
      v.linked_clone = true
      v.memory  = MEMORY_MASTER_NODE
      v.cpus    = CPUS_MASTER_NODE
      v.name  = "kmaster1"
    end	
	  # node.vm.provision "shell", path: "bootstrap_etcd.sh"
	
  end


  # Kubernetes Worker Nodes
  (1..WORKER_NODES).each do |i|

    config.vm.define "kworker#{i}" do |node|

      node.vm.box               = VAGRANT_BOX
      node.vm.box_version       = VAGRANT_BOX_VERSION
      node.vm.box_check_update  = false
      node.vm.hostname          = "kworker#{i}"

      # Set static IP
      node.vm.network "private_network", ip: "172.18.18.10#{i}"

      node.vm.provider "virtualbox" do |v|
        v.linked_clone = true
        v.memory  = MEMORY_WORKER_NODE
        v.cpus    = CPUS_WORKER_NODE
        v.name  = "kworker#{i}"
      end
    end

  end

end
