CompTIA Linux+ (LX0-104)
6.1 Configuring Basic X Features
Install Gnome
yum groupinstall -y "X Window System" "Desktop" "Fonts"
vi /etc/inittab
- id:5:initdefault:
Reboot
Install KDE
yum -y groupinstall "KDE desktop" "X Window System" "Fonts"
Select desired window manager during login
vi /etc/sysconfig/desktop
DESKTOP="KDE"
DISPLAYMANAGER="KDE"
DESKTOP="XFCE"
DISPLAYMANAGER="XDM"
DESKTOP="Gnome"
DISPLAYMANAGER="GDM"
NOTE: Display Manager entry may not be necessary if /etc/X11/prefdm is configured properly
Under the hood they all use X11 (Xorg) as their Desktop Compositor
Mir and Wayland are two up and coming replacements
Configuring Xorg
The default config works for most users
Can be customized with:
Xorg -configure
System - /user/share/X11/xorg.conf.d
User - /home/user/xorg.conf
Test using
X -config /folder/xorg.conf
Other utilities in X11:
xwininfo - Returns geometry and other window information
xdpyinfo - Returns display information
GDM
Use gconf-editor
yum install gconf-editor
vi /etc/gdm/custom.conf
KDM
yum install kdm
/usr/share/config/kdm/kdmrc
XDM
yum install xdm
/etc/X11/xdm/xdm-config
LightDM
Default desktop manager for Ubuntu
Configuration Files:
/usr/share/lightdm/lightdm.conf.d/*.conf
/etc/lightdm/lightdm.conf.d/*.conf
/etc/lightdm/lightdm.conf
Generally you do not edit the config files
Instead override in a separate file
/etc/lightdm/lightdm.conf.d/50-custom.conf
Example: Disabling Guest access and enabling username entry
[SetDefaults]
allow-guest=false
greeter-show-manual-login=true
