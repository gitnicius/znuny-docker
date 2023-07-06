#!/bin/bash

apt install wget -y
# Download Znuny
cd /opt
#wget https://download.znuny.org/releases/znuny-latest-6.5.tar.gz
wget https://download.znuny.org/releases/znuny-7.0.7.tar.gz

# Extract
#tar xfz znuny-latest-6.5.tar.gz
tar -xvzf znuny-7.0.7.tar.gz

# Create a symlink
#ln -s /opt/znuny-6.5.3/ otrs
ln -s /opt/znuny-7.0.7/ znuny


# Add user for Debian/Ubuntu
useradd -d /opt/znuny -c 'Znuny user' -g www-data -s /bin/bash -M -N otrs

useradd -d /opt/znuny -c 'Znuny user' -g www-data -s /bin/bash -M -N znuny

# Copy Default Config
cp /opt/znuny/Kernel/Config.pm.dist /opt/znuny/Kernel/Config.pm

# Set permissions
/opt/znuny/bin/otrs.SetPermissions.pl

# As otrs User - Rename default cronjobs
su - znuny
cd /opt/znuny/var/cron
for foo in *.dist; do cp $foo `basename $foo .dist`; done

#su - root

ln -s /opt/znuny/scripts/apache2-httpd.include.conf /etc/apache2/conf-available/zzz_znuny.conf

a2enmod perl headers deflate filter cgi
a2dismod mpm_event
a2enmod mpm_prefork
a2enconf zzz_znuny

/usr/sbin/apache2ctl -D FOREGROUND