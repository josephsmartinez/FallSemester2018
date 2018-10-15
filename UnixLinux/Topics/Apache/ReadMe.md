# Configuraion for Apache/httpd service

- Once php is installed you need change the configuration file located at `/etc/httpd/conf/httpd.conf ` and append the line to except `.php` extentions:  
```
#
# DirectoryIndex: sets the file that Apache will serve if a directory
# is requested.
#
<IfModule dir_module>
    DirectoryIndex index.html index.php
</IfModule>
```

## .htaccess and protecting directories
- Make sure the `AllowOverride` is set to `AuthConfig` to allow .htaccess
- Make sure in `Options` the `Indexes` option is removed  
```
<Directory "/var/www/html">
    #
    # Possible values for the Options directive are "None", "All",
    # or any combination of:
    #   Indexes Includes FollowSymLinks SymLinksifOwnerMatch ExecCGI MultiViews
    #
    # Note that "MultiViews" must be named *explicitly* --- "Options All"
    # doesn't give it to you.
    #
    # The Options directive is both complicated and important.  Please see
    # http://httpd.apache.org/docs/2.4/mod/core.html#options
    # for more information.
    #
    Options FollowSymLinks

    #
    # AllowOverride controls what directives may be placed in .htaccess files.
    # It can be "All", "None", or any combination of the keywords:
    #   Options FileInfo AuthConfig Limit
    #
    AllowOverride AuthConfig

    #
    # Controls who can get stuff from this server.
    #
    Require all granted
</Directory>
```
Create .htaccess and htpasswd file
`htpasswd  /var/www/html/mywebsite/.htpasswd userName`  
`touch .htaccess`  
Add the following into htaccess
```
AuthUserFile /var/www/html/mywebsite/.htpasswd
AuthGroupFile /dev/null
AuthName "Secure Document"
AuthType Basic
require user userName
```
## Apache Userdir with SELinux
```
#
# UserDir: The name of the directory that is appended onto a user's home
# directory if a ~user request is received.
#
# The path to the end user account 'public_html' directory must be
# accessible to the webserver userid.  This usually means that ~userid
# must have permissions of 711, ~userid/public_html must have permissions
# of 755, and documents contained therein must be world-readable.
# Otherwise, the client will only receive a "403 Forbidden" message.
#
<IfModule mod_userdir.c>
    #
    # UserDir is disabled by default since it can confirm the presence
    # of a username on the system (depending on home directory
    # permissions).
    #
    UserDir disabled root

    #
    # To enable requests to /~user/ to serve the user's public_html
    # directory, remove the "UserDir disabled" line above, and uncomment
    # the following line instead:
    #
    UserDir public_html
</IfModule>

#
# Control access to UserDir directories.  The following is an example
# for a site where these directories are restricted to read-only.
#
<Directory "/home/*/public_html">
    AllowOverride FileInfo AuthConfig Limit Indexes
    Options MultiViews Indexes SymLinksIfOwnerMatch Includes
    Require method GET POST OPTIONS
</Directory>
```


## Apache Userdir with SELinux
`setsebool -P httpd_enable_homedirs true`
[Apache Userdir with SELinux](https://www.if-not-true-then-false.com/2010/enable-apache-userdir-with-selinux-on-fedora-centos-red-hat-rhel/)

# Accessing your Virtualbox Guest from your Host OS

As a developer you want to ping and access the webserver on your virtual machine.
This is a very simple solution to enable the bridge to the guest VM.

## Requirements

* VirtualBox (latest version)
* A guest operation system (e.g. Ubuntu)

## Setup

* Shut down all running VM's
* Right click on the VM > Change... > Network
* Open Tab: **Adapter 1**
* Enable the Adapter and select "NAT"

The next step is importand to make it work:

* Open Tab: **Adapter 2**
* Enable the adapter and select: "Host-only Adapter"
* Select Name: "VirtualBox Host-only Ethernet Adapter"
* Click at "Extended"
* Select the adapter: "Intel PRO/1000 MT Desktop..."
* Select the modus: "Allow all and host"
* Click on "Ok" to save all settings.

Yes, you have to enable two adapters at the same time to make it work. Realy.
You need a "NAT" and a "Host-only Adapter".

* Start the VM
* Open the terminal (with Ctrl+Alt+T)
* Enter: `ifconfig`
* Now you should see a local IP addresse like: `192.168.56.104`
* The IP address is dynamic an can be different on your VM

## Test

* Go back into your host machine
* Open the command line: `cmd`
* Ping the guest VM with the command: `ping 192.168.56.104`
* You should see the ping response
* If you have a webserver installed on the guest VM then open `http://192.168.56.104` in your browser to the hosted website.
https://gist.github.com/odan/48fc744434ec6566ca9f7a993f4a7ffb
