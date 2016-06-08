Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.define "mgr" do |mgr|
        mgr.vm.hostname = "mgr.dev"
        mgr.vm.network :private_network, ip: "192.168.55.1"
        mgr.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
        mgr.vm.network :forwarded_port, guest: 22, host: 5555, auto_correct: true
        mgr.vm.provision  "shell", path: "ansible.sh"
    end
	

    config.vm.define "www1.dev}" do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.hostname = "www1.dev"
        node.vm.network :private_network, ip: "192.168.55.89"
        node.vm.network "forwarded_port", guest: 80, host: "8089", auto_correct: true
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
          vb.cpus = 2
        end
    end
  end
end
