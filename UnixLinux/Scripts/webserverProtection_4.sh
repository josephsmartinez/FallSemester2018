#!/usr/bin/env bash
# System wide information

function update(run_update) {
  #statements y or n
  yum update -y
}

function htaccess_config() {
  #statements
}

echo "Run update on system? >>> "
read run_update
update($run_update)
