# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

VAGRANT_API = 2
SETTINGS_FILE = "settings.yaml"

unless File.exists?(SETTINGS_FILE)
  $stderr.puts "#{SETTINGS_FILE} not found. Have you created it?"
  exit 1
end

settings = YAML.load_file(SETTINGS_FILE)

Vagrant.configure(VAGRANT_API) do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 6443, host: 6443, host_ip: "0.0.0.0"

  config.vm.define 'machine' do |machine|
    # machine.vm.hostname = "#{settings['hostname']}"
    machine.vm.network :private_network, ip: "#{settings['private_network']}"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 1
    unless settings['enable_gui']
      vb.gui = false
    end
    vb.memory = "2048"
    vb.name = "k3s-master"
  end

  config.vm.provision :docker

  config.vm.provision "shell", inline: <<-SHELL
    sudo modprobe vxlan
  SHELL

  config.vm.provision "shell", path: "install.sh", privileged: false
end
