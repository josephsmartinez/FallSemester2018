#!/usr/bin/env bash
#
# backup the etc directory!
#
cd /var/etc-backups
tar cJPf $(date +%F)-$(hostname)-etc-tar.xz /etc/

# remove older backups
#find /var/backups -type f -name '*-etc-tar.xz' -mtime +90 -delete