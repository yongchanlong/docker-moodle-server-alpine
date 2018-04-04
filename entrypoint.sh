#!/bin/bash
set -ex

if [ ! -d "/run/secrets/" ]; then
  echo '-=-~ not secrets file, so using default'
else
  export MOODLE_DB_PASS=$(cat /run/secrets/db-password )
fi
