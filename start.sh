#!/usr/bin/env bash

# Check whether there is a passwd entry for the container UID
myuid="$(id -u)"
mygid="$(id -g)"
# turn off -e for getent because it will return error code in anonymous uid case
set +e
uidentry="$(getent passwd "$myuid")"
set -e


# If there is no passwd entry for the container UID, attempt to create one
if [ -z "$uidentry" ] ; then
    if [ -w /etc/passwd ] ; then
        echo "zeppelin:x:$myuid:$mygid:anonymous uid:$ZEPPELIN_HOME:/bin/false" >> /etc/passwd
    else
        echo "Container ENTRYPOINT failed to add passwd entry for anonymous UID"
    fi
fi

exec /usr/bin/screen -s /bin/bash bin/zeppelin.sh