Ohai.plugin(:NginxData) do
  provides 'nginx_data'

  def nginx_version
    nginx_exe = 'C:\\nginx\nginx.exe'
    version = ""
    if ::File.exist?(nginx_exe)
      cmd = "#{nginx_exe} -v" 
      version = shell_out(cmd).stderr.gsub(/nginx version: nginx\//,"").chomp
    end
    version
  end

  collect_data(:default) do
    nginx_data Mash.new
    nginx_data['version'] = nginx_version
  end

end
