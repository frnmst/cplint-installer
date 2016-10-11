#!/usr/bin/env sh

# Create user and group.
getent group swish &>/dev/null || groupadd -r swish >/dev/null
getent passwd swish &>/dev/null || useradd -r -g swish -s \
/bin/false swish >/dev/null

# Add the pid file.
touch /run/swish-cplint.pid
chown swish:swish /run/swish-cplint.pid

# Create the dest pack directory.
mkdir /usr/share/swish-cplint/pack

