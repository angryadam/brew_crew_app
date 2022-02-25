#!/bin/bash

set -e

gem install bundler && bundle install --jobs=3 --retry=3
bundle check || bundle binstubs --path "$BUNDLE_BIN"
rm -f /project/tmp/pids/server.pid

exec "$@"
