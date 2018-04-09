#!/bin/sh
if [ -d "/run/secrets/" ]; then
  export MOODLE_DB_PASS=$(cat /run/secrets/db-password )
fi
exec /sbin/init
