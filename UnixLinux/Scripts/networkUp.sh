#!/usr/bin/env bash
# Configure Networking Service and Deamon processes
# Configure apache and open nessisary ports http & https


function update() {
  #statements y or n
  echo "Running update on system"
  yum update -y
}

function httpd() {
  #statements
  echo "httpd"
  yum install httpd -y 
}

function network() {
  # get networking information
  echo "confirming networking setup"
  

}

function firewall() {
  #statements
  echo "firewall"
}

function hostname() {
  #statements
  echo "hostname"
}

network
update
httpd
