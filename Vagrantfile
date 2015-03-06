VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Ubuntu 14.04 with Virtualbox Guest Additions
  # https://atlas.hashicorp.com/sincerely/boxes/trusty64
  config.vm.box = 'sincerely/trusty64'

  config.vm.network :forwarded_port, host: 4567, guest: 4567

  [
    'sudo apt-get install -y software-properties-common',
    'sudo apt-add-repository -y ppa:brightbox/ruby-ng-experimental',
    'sudo apt-get update',
    'sudo apt-get install -y emacs libpq-dev tmux ruby-switch ruby2.0 ruby2.0-dev',
    'sudo ruby-switch --set ruby2.0',
    'sudo gem install bundler',
    'sudo gem install sinatra',
    'cd /vagrant && bundle install --path vendor/bundle'
  ].each do |provisioner|
    config.vm.provision :shell, inline: provisioner
  end

end
