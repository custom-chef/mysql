include_recipe 'mysql::client'

["mysql56-libs", "mysql56"].each do |package|
  package "#{package}"
end

template '/etc/my.cnf' do
    source 'my.cnf.erb'
    owner 'root'
    group 'root'
end

["mysql56-server"].each do |package|
    package "#{package}"
end

directory '/var/run/mysqld' do
    owner 'mysql'
    group 'root'
    mode 0755
    action :create
end

service "mysqld" do
      action [ :enable, :start ]
end
