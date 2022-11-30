package ["mariadb-server","mariadb-client"] do
  action :install
end


service "mariadb" do
  action [ :enable, :start]
end

template "create.sql" do
  source "create.sql.erb"
end

bash "apply schema" do
  code "sudo mysql < create.sql"
end