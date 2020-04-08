# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "init-standalone" do |init|
    init.vm.box = "debian/contrib-stretch64"
    init.vm.hostname = "init-standalone.example.com"

    # Spin up box with
    # vagrant up --no-provision init-standalone
    # vagrant ssh init-standalone
    # sudo apt-get install -y sysvinit-core
    # exit
    # vagrant reload --provision init-standalone
    init.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y gnupg2
      wget -q -O - https://epicsdeb.bnl.gov/debian/repo-key.pub | apt-key add - > /dev/null
      apt-get install -y apt-transport-https
      echo 'deb https://epicsdeb.bnl.gov/debian/ stretch main contrib' > /etc/apt/sources.list.d/nsls2.list
      wget -q -O /tmp/puppet.deb http://apt.puppetlabs.com/puppet6-release-stretch.deb
      dpkg -i /tmp/puppet.deb
      apt-get update
      apt-get install -y puppet-agent
      cp -r /tmp/vagrant-puppet/environments /etc/puppetlabs/code/
    SHELL

    init.vm.provision :puppet do |puppet|
      puppet.options = ['--verbose']
      puppet.environment = "production"
      puppet.environment_path = "environments"
      puppet.working_directory = '/tmp/vagrant-puppet/environments/production'
      puppet.module_path = "environments/production/modules"
    end
  end

  config.vm.define "init-simpleioc" do |init|
    init.vm.box = "debian/contrib-stretch64"
    init.vm.hostname = "init-simpleioc.example.com"

    # Spin up box with
    # vagrant up --no-provision init-simpleioc
    # vagrant ssh init-simpleioc
    # sudo apt-get install -y sysvinit-core
    # exit
    # vagrant reload --provision init-simpleioc
    init.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y gnupg2
      wget -q -O - https://epicsdeb.bnl.gov/debian/repo-key.pub | apt-key add - > /dev/null
      apt-get install -y apt-transport-https
      echo 'deb https://epicsdeb.bnl.gov/debian/ stretch main contrib' > /etc/apt/sources.list.d/nsls2.list
      wget -q -O /tmp/puppet.deb http://apt.puppetlabs.com/puppet6-release-stretch.deb
      dpkg -i /tmp/puppet.deb
      apt-get update
      apt-get install -y puppet-agent
      cp -r /tmp/vagrant-puppet/environments /etc/puppetlabs/code/
    SHELL

    init.vm.provision :puppet do |puppet|
      puppet.options = ['--verbose']
      puppet.environment = "production"
      puppet.environment_path = "environments"
      puppet.working_directory = '/tmp/vagrant-puppet/environments/production'
      puppet.module_path = "environments/production/modules"
    end
  end

  config.vm.define "init-customioc" do |init|
    init.vm.box = "debian/contrib-stretch64"
    init.vm.hostname = "init-customioc.example.com"

    # Spin up box with
    # vagrant up --no-provision init-customioc
    # vagrant ssh init-customioc
    # sudo apt-get install -y sysvinit-core
    # exit
    # vagrant reload --provision init-customioc
    init.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y gnupg2
      wget -q -O - https://epicsdeb.bnl.gov/debian/repo-key.pub | apt-key add - > /dev/null
      apt-get install -y apt-transport-https
      echo 'deb https://epicsdeb.bnl.gov/debian/ stretch main contrib' > /etc/apt/sources.list.d/nsls2.list
      wget -q -O /tmp/puppet.deb http://apt.puppetlabs.com/puppet6-release-stretch.deb
      dpkg -i /tmp/puppet.deb
      apt-get update
      apt-get install -y puppet-agent
      cp -r /tmp/vagrant-puppet/environments /etc/puppetlabs/code/
    SHELL

    init.vm.provision :puppet do |puppet|
      puppet.options = ['--verbose']
      puppet.environment = "production"
      puppet.environment_path = "environments"
      puppet.working_directory = '/tmp/vagrant-puppet/environments/production'
      puppet.module_path = "environments/production/modules"
    end
  end

  config.vm.define "systemd-standalone" do |systemd|
    systemd.vm.box = "debian/contrib-buster64"
    systemd.vm.hostname = "systemd-standalone.example.com"

    # Spin up box with
    # vagrant up systemd-standalone
    # NOTE: We are installing epics-dev to work around a bug in epics-catools < 3.15.7-4 (caRepeater.service was in epics-dev instead of epics-catools)
    systemd.vm.provision "shell", inline: <<-SHELL
      wget -q -O - https://epicsdeb.bnl.gov/debian/repo-key.pub | apt-key add - > /dev/null
      echo 'deb https://epicsdeb.bnl.gov/debian/ buster main contrib' > /etc/apt/sources.list.d/nsls2.list
      wget -q -O /tmp/puppet.deb http://apt.puppetlabs.com/puppet6-release-buster.deb
      dpkg -i /tmp/puppet.deb
      apt-get update
      apt-get install -y puppet-agent epics-dev
      cp -r /tmp/vagrant-puppet/environments /etc/puppetlabs/code/
    SHELL

    systemd.vm.provision :puppet do |puppet|
      puppet.options = ['--verbose']
      puppet.environment = "production"
      puppet.environment_path = "environments"
      puppet.working_directory = '/tmp/vagrant-puppet/environments/production'
      puppet.module_path = "environments/production/modules"
    end
  end

  config.vm.define "systemd-simpleioc" do |systemd|
    systemd.vm.box = "debian/contrib-buster64"
    systemd.vm.hostname = "systemd-simpleioc.example.com"

    # Spin up box with
    # vagrant up systemd-simpleioc
    # NOTE: We are installing epics-dev to work around a bug in epics-catools < 3.15.7-4 (caRepeater.service was in epics-dev instead of epics-catools)
    systemd.vm.provision "shell", inline: <<-SHELL
      wget -q -O - https://epicsdeb.bnl.gov/debian/repo-key.pub | apt-key add - > /dev/null
      echo 'deb https://epicsdeb.bnl.gov/debian/ buster main contrib' > /etc/apt/sources.list.d/nsls2.list
      wget -q -O /tmp/puppet.deb http://apt.puppetlabs.com/puppet6-release-buster.deb
      dpkg -i /tmp/puppet.deb
      apt-get update
      apt-get install -y puppet-agent epics-dev
      cp -r /tmp/vagrant-puppet/environments /etc/puppetlabs/code/
    SHELL

    systemd.vm.provision :puppet do |puppet|
      puppet.options = ['--verbose']
      puppet.environment = "production"
      puppet.environment_path = "environments"
      puppet.working_directory = '/tmp/vagrant-puppet/environments/production'
      puppet.module_path = "environments/production/modules"
    end
  end

  config.vm.define "systemd-customioc" do |systemd|
    systemd.vm.box = "debian/contrib-buster64"
    systemd.vm.hostname = "systemd-customioc.example.com"

    # Spin up box with
    # vagrant up systemd-customioc
    # NOTE: We are installing epics-dev to work around a bug in epics-catools < 3.15.7-4 (caRepeater.service was in epics-dev instead of epics-catools)
    systemd.vm.provision "shell", inline: <<-SHELL
      wget -q -O - https://epicsdeb.bnl.gov/debian/repo-key.pub | apt-key add - > /dev/null
      echo 'deb https://epicsdeb.bnl.gov/debian/ buster main contrib' > /etc/apt/sources.list.d/nsls2.list
      wget -q -O /tmp/puppet.deb http://apt.puppetlabs.com/puppet6-release-buster.deb
      dpkg -i /tmp/puppet.deb
      apt-get update
      apt-get install -y puppet-agent epics-dev
      cp -r /tmp/vagrant-puppet/environments /etc/puppetlabs/code/
    SHELL

    systemd.vm.provision :puppet do |puppet|
      puppet.options = ['--verbose']
      puppet.environment = "production"
      puppet.environment_path = "environments"
      puppet.working_directory = '/tmp/vagrant-puppet/environments/production'
      puppet.module_path = "environments/production/modules"
    end
  end

  config.ssh.forward_agent = true
end
