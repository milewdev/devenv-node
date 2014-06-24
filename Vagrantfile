#
# Vagrantfile for a generic CoffeeScript development environment vm.
#


VAGRANTFILE_API_VERSION   = "2"
BOX                       = "OSX109"
PROVIDER_NAME             = "vmware_fusion"
PROJECT_NAME              = "dev-env-CoffeeScript-node"
VM_NAME                   = PROJECT_NAME
HOST_HOME_DIR             = { host: "~/", guest: "/.vagrant_host_home" }
PROJECT_GITHUB_URL        = "https://github.com/milewgit/#{PROJECT_NAME}.git"
PROJECT_VM_DIR            = "/Users/vagrant/Documents/#{PROJECT_NAME}"
PROVISIONER_URL           = "https://raw.githubusercontent.com/milewgit/vm-provisioner/master/Provisioner.rb"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |vagrant_config|
  with vagrant_config do
    Setup    :Box, BOX
    Setup    :Provider, PROVIDER_NAME, VM_NAME
    Setup    :SyncedFolder, HOST_HOME_DIR                 # easy way to copy gpg keys and git config from host to vm
    Install  :OsxCommandLineTools                         # needed by git
    Install  :Gpg                                         # needed to sign git commits
    Install  :Git                                         # source is on github
    Install  :Node                                        # used to run coffeescript compiler, tests under node.js
    Install  :TextMate
    Git      :Clone, PROJECT_GITHUB_URL, PROJECT_VM_DIR
    Npm      :Install, PROJECT_VM_DIR
    Reboot   :Vm
  end
end


def with(vagrant_config, &block)
  require "open-uri"
  File.write "Provisioner.rb", open(PROVISIONER_URL).read
  require_relative "Provisioner"
  Provisioner.provision(vagrant_config, &block)
end
