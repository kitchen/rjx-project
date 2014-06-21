#!/bin/bash

bundle exec puppet apply --environment production --hiera_config hiera.yaml --modulepath modules-local:modules manifests/webserver.pp
#bundle exec puppet apply --trace --environment production --hiera_config hiera.yaml --modulepath modules-local:modules manifests/webserver.pp
