#!/bin/bash
set -ex

if [ -d "/run/secrets/" ]; then
  export MOODLE_DB_PASS=$(cat /run/secrets/db-password )
fi
