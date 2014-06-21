how to use this repo:

1. Distro:
    * ubuntu: apt-get install git bundler
    * fedora: 
        1. yum install git rubygem-bundler ruby-devel
        2. yum groupinstall "Development Tools"
2. bundle install --path vendor/bundle
3. bundle exec librarian-puppet install
4. ./apply.bash

