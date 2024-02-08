#!/bin/sh
chown -R dlna:dlna /var/cache/minidlna
set -e

if [ "$1" = "start" ];then
	shift
	exec su-exec dlna minidlnad -d "$@"
fi

exec "$@"
