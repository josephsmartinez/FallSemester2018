# How to Install/Enable ELRepo on RHEL, CentOS & Scientific Linux



Using RPM
Package Naming Convention
httpd-2.4.6-31.el7.centos.x86_64.rpm

A B C D E

A = Package Name B = Version # C = Build # D = Distribution E = Architecture

x86_64 / amd64 i386 ARM noarch

Install a local package with RPM
rpm -Uvh samba-4.1.9-4.fc20.x86_64.rpm rpm -ivh webmin-1.750-1.noarch.rpm

-i Install only (no upgrade) -U Install or Upgrade -vh Displays hash marks on the screen to represent progress

Webmin Dependencies yum -y install perl perl-Net-SSLeay openssl perl-IO-Tty

List details of an installed package with RPM
rpm -qi webmin

-q Queries the package if it exists -i Displays information

Removing a package with RPM
rpm -e webmin-1.750-1.noarch.rpm

Extracting a package's contents
rpm2cpio webmin-1.750-1.noarch.rpm > webmin-1.750-1.noarch.cpio cpio -i --make-directories < webmin-1.750-1.noarch.rpm

Installing a package with Yum
yum list httpd yum install httpd yum info httpd yum erase httpd

Yum repositories
/etc/yum.repos.d/[name].repo

[Webmin]
name=Webmin Distribution Neutral
#baseurl=http://download.webmin.com/download/yum
mirrorlist=http://download.webmin.com/download/yum/mirrorlist
enabled=1
wget http://www.webmin.com/jcameron-key.asc rpm --import jcameron-key.asc

yum install webmin

https://www.2daygeek.com/install-enable-elrepo-on-rhel-centos-scientific-linux/#

# Debain 
CompTIA Linux+ LX0-103 - 102 Managing Software
In this episode, Daniel and Don explain package management when using Debian Linux distributions. They describe the different Debian package management systems like dpkg, apt-get, dselect, and aptitude; how to use them to install, configure, and remove software from your Linux system.

102.4 Use Debian Package Management
Using Debian Packages
Debian Distributions and Conventions
Originates with the Debian distro
Adopted to other Linux distros (Ubuntu, Mint, Xandros)
Debian supports many different CPU architectures
x86, x86-64, IA-64, ARM, PowerPC, Alpha, 680x0, MIPS, and SPARC
x86 native
The dpkg Command Set
Syntax
dpkg [options][action] [package-files|package-name]
action is the action to be taken by dpkg
-i or --install
--configure (Reconfigures an installed package)
-r or --remove
-P or --purge (removes package and configs)
--get-selections (Lists installed packages)
-p or --print-avail (Info about installed)
-I or --info (Info about installable)
-l or --list List packages that match the pattern
Using apt-cache
Provides info about the Debian package database
apt-cache showpkg [package name]
Displays package info
apt-cache stats
Shows package statistics
How many packages are installed, dependencies
apt-cache unmet
Finds unmet dependencies
apt-cache depends [package]
Displays specific package dependencies
rdepends finds packages that depend on the one you specify
apt-cache pkgnames [string]
Lists installed packages that begin with the specified string
Using apt-get
Similar to the YUM utility
Gets packages from a package repository
Repositories are defined in /etc/apt/sources.list
apt-get update
Gets package info updates
apt-get upgrade
Upgrades all install packages
apt-get dist-upgrade
Upgrades all packages except those that would break a dependent package
apt-get install
Installs a package
apt-get remove
Removes a package
Options to use with apt-get
-d/--download-only doesn't install
-f/--fix-broken attempts to fix broken depend
-q/--quiet no output or progress info
-y/--yes/--assume-yes answers all with yes
--no-upgrade won't upgrade if older version already installed
Using dselect, aptitude, and Synaptic
Show demos of dselect, aptitude, and Synaptic
Reconfiguring Packages
Linux programs tend to be configured through the use of configuration files
Sometimes you can mess things up when trying to configure the config files
You can reconfigure the config files back to their original state using
# dpkg-reconfigure [program-name]
Debian Packages Compared to Other Package Formats
Debian packages aren't single files, they're groups of files…
The Source Tarball
Patch file (used to modify the source code)
A .dcs file (contains the digital signature)
Debian packages tend to be more compatible with any Debian derived distro
More obscure programs might not be available in Debian package
Configuring Debian Package Tools
Debian packages usually don't require you to configure them at install
The Debian system has set defaults that work most of the time
Still, from time-to-time config might be needed
If you need to add config info then…
Main configuration file for dpkg is located at
/etc/dpkg/dpkg.cfg or ~/.dpkg.cfg
Edit this file to include needed arguments
Main configuration file for APT is located at
/etc/apt/apt.conf (works for DSELECT too)
SHOW THIS sample config file
/usr/share/doc/apt/examples/apt.conf
Package tools rely on various files found in the /var/lib/dpkg directory
This is basically the database of install files
Handle with care ;)
