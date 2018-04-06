#!/bin/sh
export ABC='sdfsdf'

chown apache:apache -R /var/moodledata
exec /usr/sbin/httpd -D FOREGROUND
