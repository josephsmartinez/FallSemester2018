#!/usr/bin/env bash
# Configure Fire Settings

function update(run_update) {
  #statements y or n
  yum update -y
}

function users() {
  #statements
}

function shells_config() {
  #statements
}


echo "Run update on system? >>> "
read run_update
update($run_update)
