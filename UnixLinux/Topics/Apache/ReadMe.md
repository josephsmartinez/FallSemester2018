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

