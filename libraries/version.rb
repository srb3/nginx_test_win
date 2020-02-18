#
# Chef Documentation
# https://docs.chef.io/libraries.html
#

#
# This module name was auto-generated from the cookbook name. This name is a
# single word that starts with a capital letter and then continues to use
# camel-casing throughout the remainder of the name.
#
module Winnginx
  module VersionHelpers
    def is_current?(cmd, target_version)
      Chef::Log.error "target_version: #{target_version}"
      Chef::Log.error "shellout: #{shell_out(cmd).stderr.gsub(/nginx version: nginx\//,"")}"
      shell_out(cmd).stderr.gsub(/nginx version: nginx\//,"") == target_version
    end
  end
end

#
# The module you have defined may be extended within the recipe to grant the
# recipe the helper methods you define.
#
# Within your recipe you would write:
#
#     extend Winnginx::VersionHelpers
#
#     my_helper_method
#
# You may also add this to a single resource within a recipe:
#
#     template '/etc/app.conf' do
#       extend Winnginx::VersionHelpers
#       variables specific_key: my_helper_method
#     end
#
