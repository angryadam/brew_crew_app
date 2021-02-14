#!/bin/bash

set -e

bundle check || bundle binstubs --path "$BUNDLE_BIN"
rm -f /project/tmp/pids/server.pid

exec "$@"
