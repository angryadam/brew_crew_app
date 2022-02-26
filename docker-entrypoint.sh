#!/bin/bash

set -e

bundle check || bundle binstubs --path "$BUNDLE_BIN"
bundle install --jobs=3
rm -f /project/tmp/pids/server.pid

exec "$@"
