# == Define: profile::site::php
#
# sets up a php site with php fpm and all that fun stuff
#
# === Parameters
#
# [*title*]
#   the name of the resource is used as the name of the site
# [*docroot*]
#   the documentroot for the site
# [*user*]
#   the user to run the site under
#   also the mysql username
# [*serveraliases*]
#   A list of other names this site responds to
# [*fpm_port*]
#   the port for the fpm listener to listen on
# [*database_password*]
#   password for the mysql database
#
# === Caveats
#
# the user must exist first.
#
# === Examples
#
#  profile::site::php { 'example.com':
#    docroot => '/home/example/sites/example.com',
#    user    => 'example',
#  }
#
# === Authors
#
# Jeremy Kitchen <kitchen@kitchen.io>
#
# === Copyright
#
# Copyright 2014 Jeremy Kitchen
#
define profile::site::php (
  $docroot,
  $user,
  $fpm_port,
  $database_password,
) {
  include profile::apache
  include profile::fpm
  include php::extension::mysql

  # WARNING: portability
  #$fpm_sock_file = "/var/run/php_fpm_socket_${user}_${name}"
  

  apache::vhost { $name:
    docroot => $docroot,
    docroot_owner => $user,
    serveraliases => $serveraliases,
    # WARNING: security (ubuntu doesn't supoprt unix sockets for proxypass :(
    custom_fragment => inline_template('ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:<%= @fpm_port %>/<%= @docroot %>/$1'),
  }

  php::fpm::pool { "${user}_${name}":
    listen => "127.0.0.1:${fpm_port}",
    user => $user,
  }

  mysql::db { $name:
    user => $user,
    host => 'localhost',
    password => $database_password,
    grant => [ 'ALL' ],
  }
}
