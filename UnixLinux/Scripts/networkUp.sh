#!/usr/bin/env bash
# Configure Networking Service and Deamon processes

function update(run_update) {
  #statements y or n
  yum update -y
}

function httpd() {
  #statements
}

function network() {
  # get networking information
}

function firewall() {
  #statements
}

function hostname(hostname_is) {
  #statements
}

echo "Run update on system? >>> "
read run_update
update($run_update)
