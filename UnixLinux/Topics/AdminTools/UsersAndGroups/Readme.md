# Managing Users and Groups
Creating users:
useradd
useradd -d -e -g -G -p -s -u
userdel
Use -r to remove their files as well
usermod
Rename account: usermod -l jdoe jsmith
Lock account: usermod -L jdoe
Unlock account: usermod -U jdoe
Add user to group: usermod -a -G Marketing
Set password:
passwd
chage (Define password expiration policy)
Display current info: chage -l jdoe
Modify policy: chage -m -M -E -W jdoe
Default values:
/etc/login.defs
/etc/default/useradd
/etc/skel
Account details:
/etc/passwd
Defines accounts
User ID
UIDs typically start at 500
Users/Groups can share an ID (not ideal)
/etc/shadow
/etc/group
Create groups:
groupadd
groupdel
gpasswd
Add a user: gpasswd -a
Remove a user: gpasswd -d
Add a group admin: gpasswd -A `
Using groups
Users perform all actions under their primary group by default
newgrp temporarily changes that context
chgrp/chown can also be used
groups to see group membership
Prevent an account from logging in interactively
e.g. chsh -s /bin/nologin
Getting information
getent passwd
getent shadow
getent group
groups
