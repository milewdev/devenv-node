#
# Vagrantfile for a generic CoffeeScript development environment vm.
#


VAGRANTFILE_API_VERSION   = "2"
BOX                       = "OSX109"
PROVIDER                  = "vmware_fusion"
PROJECT_NAME              = "dev-env-CoffeeScript-node"
VM_NAME                   = PROJECT_NAME
SYNCED_HOST_HOME_FOLDER   = { host: "~/", guest: "/.vagrant_host_home" }
PROJECT_GITHUB_URL        = "https://github.com/milewgit/#{PROJECT_NAME}.git"
PROJECT_VM_PATH           = "/Users/vagrant/Documents/#{PROJECT_NAME}"
PROVISIONER_URL           = "https://raw.githubusercontent.com/milewgit/vm-installers/master/Provisioner.rb"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |vagrant_config|
  with vagrant_config do
    Setup    :Box, BOX
    Setup    :Provider, PROVIDER, VM_NAME
    Setup    :SyncedFolder, SYNCED_HOST_HOME_FOLDER       # easy way to copy gpg keys and git config from host to vm
    Install  :OsxCommandLineTools                         # needed by git
    Install  :Gpg                                         # needed to sign git commits
    Install  :Git                                         # source is on github
    Install  :Node                                        # used to run coffeescript compiler, tests under node.js
    Install  :TextMate
    Git      :Clone, PROJECT_GITHUB_URL, PROJECT_VM_PATH
    Npm      :Install, PROJECT_VM_PATH
    Reboot   :Vm
  end
end


def with(vagrant_config, &block)
  require "open-uri"
  # open("Provisioner.rb", "w") { |file| file.write open(PROVISIONER_URL).read }
  require_relative "Provisioner"
  Provisioner.new(vagrant_config).provision(&block)
end
