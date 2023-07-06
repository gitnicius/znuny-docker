#!/bin/bash

apt update
apt install mariadb-client cpanminus -y
apt install apache2 mariadb-client mariadb-server cpanminus libapache2-mod-perl2 libdbd-mysql-perl libtimedate-perl libnet-dns-perl libnet-ldap-perl libio-socket-ssl-perl libpdf-api2-perl libsoap-lite-perl libtext-csv-xs-perl libjson-xs-perl libapache-dbi-perl libxml-libxml-perl libxml-libxslt-perl libyaml-perl libarchive-zip-perl libcrypt-eksblowfish-perl libencode-hanextra-perl libmail-imapclient-perl libtemplate-perl libdatetime-perl libmoo-perl bash-completion libyaml-libyaml-perl libjavascript-minifier-xs-perl libcss-minifier-xs-perl libauthen-sasl-perl libauthen-ntlm-perl libhash-merge-perl libical-parser-perl libspreadsheet-xlsx-perl libcrypt-jwt-perl libcrypt-openssl-x509-perl jq -y

cpanm install Jq