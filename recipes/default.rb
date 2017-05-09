#
# Cookbook Name:: bjc-ssl
# Recipe:: ssl
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'apache2'

template '/etc/apache2/sites-available/default-ssl.conf' do
  action :create
  source 'default-ssl.conf.erb'
  notifies :restart, 'service[apache2]', :immediately
end

service 'apache2' do
  action :nothing
end

execute 'a2enmod ssl'

execute 'a2ensite default-ssl'

