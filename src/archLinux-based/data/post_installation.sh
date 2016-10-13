#!/usr/bin/env sh

#
# post_installation.sh
#
# Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>
#
# This file is part of cplint-installer.
#
# cplint-installer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# cplint-installer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with cplint-installer.  If not, see <http://www.gnu.org/licenses/>.
#
#

# Create user and group.
getent group swish &>/dev/null || groupadd -r swish >/dev/null
getent passwd swish &>/dev/null || useradd -m -d /home/swish \
-r -g swish swish >/dev/null

# Create the dest pack directory.
[ ! -d /home/swish/pack ] && mkdir /home/swish/pack
chown -R swish:swish /home/swish/pack
