include profile::base
include profile::apache
include profile::fpm

profile::site::php { 'rjx.ktc.hn':
  user => 'kitchen',
  docroot => '/home/kitchen/rjx.kitchen.io',
  fpm_port => 9000,
}
