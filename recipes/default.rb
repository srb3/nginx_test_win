#
# Cookbook:: winnginx
# Recipe:: default
#
# Copyright:: 2019, Steve Brown
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


ohai_plugin 'nginx'

Chef::Log.error "ver_compare: #{node['nginx_data']['version']} == #{node['nginx']['nginx_version']}"
Chef::Log.error "ver_compare: #{node['nginx_data']['version'] == node['nginx']['nginx_version']}"

remote_file node['nginx']['filepath'] do
  source          node['nginx']['url']
  show_progress   true
  action :create
  not_if { node['nginx_data']['version'] == node['nginx']['nginx_version'] }
end

archive_file 'extract nginx zip file' do
  path node['nginx']['filepath']
  destination 'C:\\nginx_extract'
end

link 'C:\\nginx' do
  to "C:\\nginx_extract\\nginx-#{node['nginx']['nginx_version']}"
end

dsc_script 'get-dsc-resource-kit' do
  code <<-EOH
    Archive reskit
    {
      ensure = 'Present'
      path = "#{Chef::Config[:file_cache_path]}\\DSCResourceKit620082014.zip"
      destination = "#{ENV['PROGRAMW6432']}\\WindowsPowerShell\\Modules"
    }
  EOH
end
