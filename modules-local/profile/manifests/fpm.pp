# == Class: profile::fpm
#
# sets up basic fpm service
#
# === Authors
#
# Jeremy Kitchen <kitchen@kitchen.io>
#
# === Copyright
#
# Copyright 2014 Jeremy Kitchen
#
class profile::fpm {
  include php::fpm
  include apache::mod::proxy
  apache::mod { 'proxy_fcgi': }
}
