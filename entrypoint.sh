#!/bin/bash

set -e

rm -f /sample_project/tmp/pids/server.pid

exec "$@"