Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |v|
    v.memory = 1024
  end

  config.vm.define "raddit-app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.hostname = "raddit-app"
    app.vm.synced_folder "raddit-app/", "/srv/raddit-app"
    # use port forwarding make application accessible on localhost
    app.vm.network "forwarded_port", guest: 9292, host: 9292
    # system configuration is done by Ansible
    app.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/configuration.yml"
    end
  end
end
