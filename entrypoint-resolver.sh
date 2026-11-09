#!/bin/bash
set -e

unbound -c /etc/unbound/unbound.conf

exec "$@"
