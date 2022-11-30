remote_file "/tmp/latest-ja.tar.gz" do
    source "https://ja.wordpress.org/latest-ja.tar.gz"
    owner "root"
    group "root"
    mode "0644"
end

script "install_wordpress" do
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code <<-EOH
      tar xvf latest-ja.tar.gz
      mv wordpress /var/www/html/
      chown -R www-data:www-data /var/www/html/wordpress
    EOH
end