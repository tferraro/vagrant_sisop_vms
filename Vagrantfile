# -*- mode: ruby -*-
# vi: set ft=ruby :

adapter_mode = ENV['SISOP_NETWORK_TYPE'] == 'public'

def base_provision(config)
  config.vm.provision :shell, path: 'vagrant/provision.sh', args: 'stable', privileged: true
  config.vm.provision :shell, path: 'vagrant/provision-locale.sh', args: 'stable', privileged: true
  config.vm.provision :shell, path: 'vagrant/install-rvm.sh', args: 'stable', privileged: false
  config.vm.provision :shell, path: 'vagrant/install-ruby.sh', args: '2.6.4', privileged: false
end

Vagrant.configure('2') do |config|
  config.vm.define "server", autostart: false do |server|
    server.vm.box = 'ubuntu/bionic64'
    server.vm.hostname = "utnso-server"

    server.vm.network 'public_network' if adapter_mode

    server.vm.provider 'virtualbox' do |vb|
      # Display the VirtualBox GUI when booting the machine
      # vb.gui = true
      vb.name = "UTN SO - Server"
      vb.memory = '1024'
    end

    base_provision(server)
    server.vm.provision :reload
  end

  config.vm.define "lubuntu" do |gui|
    gui.vm.box = 'ubuntu/bionic64'
    gui.vm.hostname = "utnso-gui"

    gui.vm.network 'public_network' if adapter_mode

    gui.vm.provider 'virtualbox' do |vb|
      vb.name = "UTN SO - Lubuntu"
      vb.memory = '1024'
    end

    base_provision(gui)
    gui.vm.provision :shell, path: 'vagrant/install-gui.sh', privileged: true
    gui.vm.provision :reload
  end
end
