# -*- mode: ruby -*-
# vi: set ft= ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	
	config.vm.provision "shell", inline: "apt-get update && apt-get upgrade --yes"	

	
	config.vm.define "saltstack" do |saltstack|
		saltstack.vm.box = "debian_wheezy"
		saltstack.vm.hostname="saltstack"
		saltstack.vm.network "private_network", ip: "10.1.1.10"	
		saltstack.vm.provision "shell" do |s| 
			s.path= "sh/nstall_saltstack.sh"
			s.args = ["master"]
		end	
		saltstack.vm.provision "shell", path: "sh/syntax_yaml.sh"
		saltstack.vm.synced_folder "salt/roots/", "/srv/salt/"
	end
	
	config.vm.define "haproxy" do |haproxy|
		haproxy.vm.box = "debian_wheezy"
		haproxy.vm.hostname="haproxy"
		haproxy.vm.network "private_network", ip: "10.1.1.20"
		haproxy.vm.provision "shell" do |s| 
			s.path= "sh/install_saltstack.sh"
			s.args = ["minion"]
		end	
	end

	config.vm.define "web01" do |web01|
		web01.vm.box = "debian_wheezy"
		web01.vm.hostname="web01"
		web01.vm.network "private_network", ip: "10.1.1.30"
		web01.vm.provision "shell" do |s| 
			s.path= "sh/install_saltstack.sh"
			s.args = ["minion"]
		end	
	end
	
	config.vm.define "web02" do |web02|
		web02.vm.box = "debian_wheezy"
		web02.vm.hostname="web02"
		web02.vm.network "private_network", ip: "10.1.1.40"
		web02.vm.provision "shell" do |s| 
			s.path= "sh/install_saltstack.sh"
			s.args = ["minion"]
		end	
	end
end
