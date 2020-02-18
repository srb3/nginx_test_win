name 'nginx_test_win'
maintainer 'Steve Brown'
maintainer_email 'sbrown@chef.io'
license 'Apache-2.0'
description 'Installs/Configures winnginx'
long_description 'Installs/Configures winnginx'
version '0.1.0'
chef_version '>= 14.0'

%w(windows).each do |os|
  supports os
end


issues_url 'https://github.com/devoptimist/nginx_test_win/issues'
source_url 'https://github.com/devoptimist/nginx_test_win'

depends 'ohai'
