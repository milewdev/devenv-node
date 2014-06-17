#
# Generic Vagrantfile for a CoffeeScript development environment vm.
#


VAGRANTFILE_API_VERSION           = "2"
BOX                               = "OSX109"
PROVIDER                          = "vmware_fusion"
VM_NAME                           = "dev-env-CoffeeScript-node"
SYNCED_HOST_HOME_FOLDER           = { host: "~/", guest: "/.vagrant_host_home" }
SYNCED_DOWNLOAD_CACHE_FOLDER      = { host: "cache", guest: "/.vagrant_download_cache" }
PROJECT_SOURCE_URL                = "https://github.com/milewgit/dev-env-CoffeeScript-node.git"
PROJECT_VM_PATH                   = "/Users/vagrant/Documents/dev-env-CoffeeScript-node"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |vagrant_config|
  with vagrant_config do
    select_box BOX
    setup_provider PROVIDER, VM_NAME
    setup_synced_folder SYNCED_HOST_HOME_FOLDER         # easy way to copy gpg keys and git config from host to vm
    setup_synced_folder SYNCED_DOWNLOAD_CACHE_FOLDER    # guest needs access to downloaded files cached on the host
    install_osx_command_line_tools                      # needed by git
    install_gpg                                         # needed to sign git commits
    install_git                                         # source is on github
    install_node                                        # used to run coffeescript compiler, tests under node.js
    install_editor
    install_project_source_code PROJECT_SOURCE_URL, PROJECT_VM_PATH
    npm_install PROJECT_VM_PATH
    reboot_vm
  end
end


def with(vagrant_config, &block)
  
  # Retrieve Installers.rb from git and load it
  # require "open-uri"
  # open("Installers.rb", "w") do |file|
  #   file << open("https://raw.githubusercontent.com/milewgit/dev-env-CoffeeScript-node/master/Installers.rb").read
  # end
  require_relative "Installers"
  
  Installers.new(vagrant_config).run(&block)
  
end
