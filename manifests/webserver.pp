include profile::base
include profile::apache
include profile::fpm
include profile::mysql

profile::site::php { 'rjx.ktc.hn':
  user => 'kitchen',
  docroot => '/home/kitchen/rjx.ktc.hn',
  fpm_port => 9000,
  database_password => 'fbc5da1fd7791c4512424440b26e2336',
}
