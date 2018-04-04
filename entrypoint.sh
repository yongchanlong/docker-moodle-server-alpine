#!/bin/bash
set -ex

if [ -d "/run/secrets/" ]; then
  export MOODLE_DB_PASS=$(< /run/secrets/db-password)
fi
