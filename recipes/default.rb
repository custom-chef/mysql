package 'mysql' do
      action :install
end

service 'mysql' do
    port '3306'
    version '5.5'
    initial_root_password 'dorubakodorubako'
    action [:create, :start]
end
