# == Class: profile::base
#
# base set of things
#
# === Authors
#
# Jeremy Kitchen <kitchen@kitchen.io>
#
# === Copyright
#
# Copyright 2014 Jeremy Kitchen
#
class profile::base {
  include sudo

  $base_packages = [
    'vim-nox', 'zsh', 'git'
  ]

  package { $base_packages: }

  user { 'kitchen':
    managehome => true,
    uid => '1000',
    shell => '/bin/zsh',
    require => Package['zsh'],
  }

  ssh_authorized_key { 'kitchen@venus':
    key => 'AAAAB3NzaC1kc3MAAACBAPPco585nKtDgBxLI+h7TecDPmWQMs7OCoS8nJ4rKlw8tA70nQHPoQSzevUnKGJkxgANInJQP88Bh5i1i8W+pYp/J2GbI8lhVzY20ktJK5++j1uln7LOUFl0KW5qdTj+g6cOOFOLOwsSvqvSL7hhYpo7Qkj0hhKiXiCEbVLde43pAAAAFQChW46nbMe/yUmL+yAQa8PVsPOuIwAAAIEArGczXRyMeNJKTZ+cUf9LiR5wUhZYnWvFR8ld6xdRwxskMy9Ts+SxQUeP/tcHLFMTm0oqYHZBtj1EvuXh9p047G9q7t+Vl34Qh6ofWYhvXeZ2eE0uEuIPze7kOXa24xLj1kbd7jTpwJvauTjpdaZZHR8kyD58qOzkYdnzL+F24YgAAACBAOYmr2kxZiB/hmjaRu+ZVNrcAM9c6Z7NBjrfOspqF4L5JDDul0t3YXJJW1s9xB+LTdDWdcyF3C2fVfJpy3uneeb27tlPLo+/5uOce9Cfo2ix98S28XPYKZGR9e7bqp3DAibX19n92PUAVCGYjlI6rQCvqaBxWpmXSB0zv2F7ueSO',
    type => 'ssh-dss',
    user => 'kitchen',
  }

  sudo::conf { 'kitchen sudo':
    content => 'kitchen ALL=(ALL) NOPASSWD: ALL',
  }
    
    

}
