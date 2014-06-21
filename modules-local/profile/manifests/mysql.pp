# == Class: profile::mysql
#
# sets up a mysql server
#
# === Authors
#
# Jeremy Kitchen <kitchen@kitchen.io>
#
# === Copyright
#
# Copyright 2014 Jeremy Kitchen
#
class profile::mysql {
  include ::mysql::server
}
