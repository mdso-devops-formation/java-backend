Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-20.04"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
    v.name = "ubuntu20.3"
  end
  config.vm.provision "shell", privileged: true, inline: "apt update"
end
