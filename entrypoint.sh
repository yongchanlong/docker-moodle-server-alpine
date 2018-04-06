#!/bin/sh
if [ -d "/run/secrets/" ]; then
  export MOODLE_DB_PASS=$(cat /run/secrets/db-password )
fi
export ABC='sdfsdf'

chown apache:apache -R /var/moodledata
exec /usr/sbin/httpd -D FOREGROUND
