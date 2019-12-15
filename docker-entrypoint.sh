#! /bin/bash

set -eu

bundle check || bundle install

exec "$@"