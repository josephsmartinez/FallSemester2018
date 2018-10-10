# System Time

Controlling Time
Unfortunately, varies by distro
Places to check:
/etc/timezone
/etc/localtime
/usr/share/zoneinfo
tzselect
tzconfig
$TZ
In RedHat/CentOS use:
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
In Ubuntu:
vi /etc/timezone
America/New_York
Determine current time settings
date
hwclock -r
date -s "20 JUN 2014 12:00:00"
hwclock --systohc (or -w)
hwclock --hctosys (or -s)
Using NTP
yum install ntp
vi /etc/ntp.conf
server pool.ntp.org
service ntpd start
Display servrs: ntpq -p
Update using:
One time: ntpdate pool.ntp.org or ntpd -gq
Scheduled: 60 * * * * root /usr/sbin/ntpd -q -u ntp:ntp
