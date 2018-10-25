# How To's




git clone https://github.com/rdesktop/rdesktop.git
./bootstrap
yum install openssl-devel
yum install libXcursor-devel
yum install pcsc-*
make
make install


###  How To Change Port Number For GlassFish
Both Oracle an GlassFish runs by default on port number 8080,results in port conflict
Following are simple steps to change the port number of glassfish server :

Go to the folder where Glassfish is installed.
Locate config folder which is as follows: C:\Program Files\glassfish-3.0.1\glassfish\domains\domain1\config
Open domain.xml using any text editor.
Look for 8080 and change it to some other port number that doesn’t conflict with other port numbers.
Save domain.xml.
Now  remove GlassFish from NetBeans and add it again so that NetBeans IDE understands the new port number.
Restart GlassFish, if it was already running.
http://ohmjavaclasses.blogspot.com/2012/01/how-to-change-port-number-for-glassfish.html



To Change the Administration Password GlassFish
https://docs.oracle.com/cd/E19798-01/821-1751/ghgpu/index.html


Notes: 

https://galaxy.ansible.com/kami911/tomcat